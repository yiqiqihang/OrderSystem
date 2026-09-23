# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Chinese-language cafeteria/canteen ordering system (餐厅网络点餐系统) for an enterprise staff restaurant. Java Servlets + JSP + MyBatis on Oracle, served by Tomcat. UI is built on the layui component library. Comments, UI strings, and role names are in Chinese; keep that convention when editing.

## Build and run

There is no Maven, Gradle, or Ant build. This is a **raw IntelliJ IDEA web module** (`OrderSystem.iml`) compiled by the IDE and deployed to Tomcat 8.5.13 as an exploded WAR (`out/artifacts/OrderSystem_war_exploded`).

Consequences you must plan around:

- **`.idea/` is absent from the repo**, so the project libraries and run configuration the module depends on do not exist on a fresh checkout. `OrderSystem.iml` expects an application-server library named `Tomcat 8.5.13` plus project libraries `ojdbc8`, `lib`, `Java EE 6-Java EE 6`, `jxl`, `jstl`, `standard`, `jstl-1.2`. These must be recreated in IDEA before the module compiles.
- `OrderSystem.iml` also lists a resource root `poi-bin-5.2.3/lib` that **is not present** in the tree. Apache POI is referenced by no live source file, so this is a stale entry; do not assume POI is available.
- There is **no test framework** anywhere (no JUnit jar in `lib/` or `web/WEB-INF/lib/`). `src/order/test/` holds two scratch classes whose bodies are almost entirely commented out, so there is no "run a single test" command. Verification happens by deploying and exercising the JSP pages.
- Runtime dependencies are checked-in jars under `web/WEB-INF/lib/` (mybatis 3.2.7, ojdbc8, fastjson, hutool-all, commons-fileupload/io, jstl, log4j, slf4j). `lib/` at the repo root holds Java EE API jars and `jxl.jar` used only for compilation.
- `out/` is committed build output and is stale, including odd artifacts such as a directory literally named `" (5)"` and a nested `WEB-INF/classes/out`. Never edit anything under `out/`; change `src/`, `web/`, or `config/` and let the IDE redeploy.

Oracle must be reachable at the coordinates in `config/mybatis-config.xml`, which also contains the database username and password in plain text.

## Request architecture

Flow is JSP → servlet → service interface/impl → MyBatis mapper interface → mapper XML → Oracle.

**Servlets are multi-endpoint dispatchers.** Instead of one servlet per action, a controller declares several `.do` paths in a single `@WebServlet` array, then branches on the request URI inside `doPost`:

```java
@WebServlet({"/selectrecipe.do","/delectrecipe.do","/recipeUpdate.do","/addCP.do","/addImage.do","/selectcheck.do"})
// ...
String uri = request.getRequestURI();
if (uri.endsWith("selectrecipe.do")) { ... }
else if (uri.endsWith("delectrecipe.do")) { ... }
```

`doGet` always delegates to `doPost`. Adding an action means adding the path to the annotation array *and* an `endsWith` branch. Controllers live directly in the `order` package; services in `order.server`; mappers in `order.mapper`; POJOs in `order.pojo`.

**Responses are hand-built JSON strings**, not serialized objects. Controllers use fastjson for the row array, then concatenate the layui table envelope by hand:

```java
String json = JSON.toJSONString(recipes);
String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
response.getWriter().println(jsonrs);
```

Mutation endpoints instead print a bare `"0"`/`"1"` flag that the calling JavaScript compares as a string. Note the flag polarity is inconsistent between actions: `delectrecipe.do` and `recipeUpdate.do` treat `"1"` as success, while `addCP.do` treats `"0"` as success. Check the specific branch before relying on it.

**Pagination is computed in the controller** from layui's `page`/`limit` query params into a `pageInfo(start, limit)`, and executed as an Oracle `rownum` subquery in the mapper XML. `count` in the envelope comes from a separate count query.

## MyBatis conventions and traps

**Mapper XML files have no `.xml` extension.** `src/order/mapper/` contains pairs like `recipeMapper.java` (the interface) and `recipeMapper` (the XML, extensionless). Every mapper must be registered by hand in `config/mybatis-config.xml`, using backslash resource paths:

```xml
<mapper resource="order\mapper\recipeMapper"></mapper>
```

Adding a mapper means creating both files, matching `namespace` to the fully-qualified interface name, and adding the `<mapper resource>` line. The backslashes are Windows-specific, so this configuration is unlikely to load as-is on Linux or macOS.

`MybatisUtil.getSqlSession()` reads `mybatis-config.xml` from the classpath root, since `config/` is a resource root, and returns `openSession(true)`. Autocommit is therefore on and there is no transaction boundary. It also builds a brand-new `SqlSessionFactory` on every call, which is expensive and non-standard.

Two different session lifecycles coexist. Most service impls open and close one session per method:

```java
SqlSession sqlSession = MybatisUtil.getSqlSession();
recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);
sqlSession.close();
```

`usersServiceImpl` instead holds the session and mapper as instance fields, and several `orderPersonImpl` methods never close the session at all, among them `M_OrderList`, `M_personOrderList`, `selectO_price` and `monthCountUser`. Follow the open-and-close-per-method form in new code.

**POJO fields are upper-case Oracle column names**, such as `R_ID`, `U_LOGINNAME` and `OM_WEIGHT`. That makes the generated getters `getR_ID()` and `getU_LOGINNAME()`, and the resulting bean property names lower-camel, such as `r_ID` and `u_NAME`. This is the largest source of silent breakage, because a mapper placeholder must match the property name and the existing files disagree with each other. The recipe mapper uses an upper-case placeholder in its `addrecipe` statement but lower-camel placeholders in `insertRecipe` and `updateRecipe`. JSP expression language uses the lower-camel form too. When adding a query, copy the casing from a placeholder already known to work for that same POJO.

Table names carry a hardcoded `MXH.` schema prefix in many statements and omit it in others, and some identifiers are double-quoted, which makes them case-sensitive in Oracle. Match the surrounding style of the file you edit.

## Authentication and filters

Two filters both map to `/*`. One forces UTF-8 on request and response. The other, `CheckLoginFilter`, gates everything on a session attribute named `users` and redirects to the login page when it is absent.

The whitelist in `CheckLoginFilter` is a chain of substring tests rather than path matches, covering the login and register pages, the login and captcha servlets, the layui and login-css asset folders, the image folder, and anything ending in `.js` or `.css`. Because they are substring tests, any new URL that happens to contain one of those tokens is silently unauthenticated. Add public endpoints deliberately.

Login lives in `order.util.LoginService` rather than in a controller. It compares the hutool-generated captcha held in session against the submitted value, then delegates to the user service. **Passwords are compared as plain text** against the password column, with no hashing anywhere in the codebase. A cookie carries the previous login timestamp into the page footer. Logout is handled by `usersController`, which clears the session attribute.

**Authorization is presentation-only.** The main page shows and hides navigation entries using expression language against the user role, matching Chinese role strings for restaurant manager, kitchen supervisor, finance, caterer and staff. No servlet re-checks the role, so any logged-in user can invoke any endpoint directly. Treat that as a known gap rather than a pattern to copy.

## Data model and the ordering flow

Oracle tables, all in schema `MXH`: users, the master dish catalogue `RECIPE`, the currently published `MENU`, the shared cart `ORDER_MEAL`, order headers in `ORDER_FORM`, the flattened per-person reporting table `ORDERPERSON`, and `STORAGE`.

The lifecycle, driven mainly by the meal and menu controllers:

1. Dishes are maintained in the recipe catalogue, then promoted into the current menu.
2. Ordering adds rows to the shared cart. Re-ordering the same dish increments quantity and price in place instead of inserting a duplicate row.
3. Committing an order reads the logged-in user from session, aggregates cart dish names with Oracle `LISTAGG`, sums the total, inserts one order header, then runs an insert-select that joins the header to the cart on the newest order id and flattens the result into the reporting table.
4. On success the cart is emptied with `TRUNCATE TABLE`, which is DDL against a shared table with no per-user filter. The cart table is global, so concurrent users share one cart and any commit wipes everyone else's.

Reporting queries build current-month predicates from `SYSDATE`, and the daily catering summary restricts order time to today between midnight and a hardcoded 09:00 cutoff. Summary pages render with plain layui tables. Note that `web/js/echarts.min.js` is bundled but referenced by no page, so there is no chart rendering anywhere in the application.

## File upload

`UploadFileUtil.uploadFile` parses multipart requests with commons-fileupload, writes into the servlet context real path for the image folder, and returns the file name, which the recipe controller stashes in session. The UUID prefixing that would prevent collisions is commented out, so re-uploading a file of the same name silently overwrites the original. The stale deployed output contains both a UUID-prefixed upload folder and a flat image folder, evidence of an earlier scheme. Current code writes to the flat image folder.

## Dead code and dangling endpoints

Do not assume an endpoint referenced from a JSP resolves to anything. These mismatches are confirmed:

- The change-password form posts to an action that **no servlet declares**, so password changing is unimplemented. That page is also wired into the navigation as the help centre.
- The introduction page calls an add-recipe endpoint that has no handler.
- A register endpoint is whitelisted in the login filter and a register page exists, but there is no registration servlet.
- A month-count endpoint appears only inside commented-out AJAX, although the matching service method and query do exist.
- `newMenuMessage` declares an endpoint whose `doPost` body is **empty**.
- The order-person controller declares two endpoints differing only in the case of one letter. The lower-case variant is never called.
- `order.util.Multiple` is an empty class. The Excel export sketch under `src/order/test/` is entirely commented out and depends on jxl, and the MyBatis scratch class has an empty `main`. No Excel export is reachable from the user interface.

Other rough edges worth knowing before touching nearby code. One add-recipe branch inserts with a hardcoded primary key. Controllers call `setContentType("utf-8")`, which is not a valid MIME type, and the effective charset actually comes from the encoding filter. The class inside `blankOrderController.java` is spelled without the letter e while its service, mapper and POJO all spell it `blanketOrder`. The recipe update branch reads image and instruction parameters that its SQL never persists. Debugging `System.out.println` calls are pervasive and serve as the de facto logging, even though log4j is on the classpath.
