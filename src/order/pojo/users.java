package order.pojo;

public class users {
    private String U_ID;//用户ID
    private String U_NAME;//用户姓名
    private String U_LOGINNAME;//用户登录名
    private String PASSWORD;
    private String U_PHONE;
    private String DEPARTMENT;
    private String ROLE;
    private String U_PICTURE;

    public users(String u_ID, String u_NAME, String u_LOGINNAME, String PASSWORD, String u_PHONE, String DEPARTMENT, String ROLE, String u_PICTURE) {
        U_ID = u_ID;
        U_NAME = u_NAME;
        U_LOGINNAME = u_LOGINNAME;
        this.PASSWORD = PASSWORD;
        U_PHONE = u_PHONE;
        this.DEPARTMENT = DEPARTMENT;
        this.ROLE = ROLE;
        U_PICTURE = u_PICTURE;
    }

    public users() {
    }

    public String getU_ID() {
        return U_ID;
    }

    public void setU_ID(String u_ID) {
        U_ID = u_ID;
    }

    public String getU_NAME() {
        return U_NAME;
    }

    public void setU_NAME(String u_NAME) {
        U_NAME = u_NAME;
    }

    public String getU_LOGINNAME() {
        return U_LOGINNAME;
    }

    public void setU_LOGINNAME(String u_LOGINNAME) {
        U_LOGINNAME = u_LOGINNAME;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getU_PHONE() {
        return U_PHONE;
    }

    public void setU_PHONE(String u_PHONE) {
        U_PHONE = u_PHONE;
    }

    public String getDEPARTMENT() {
        return DEPARTMENT;
    }

    public void setDEPARTMENT(String DEPARTMENT) {
        this.DEPARTMENT = DEPARTMENT;
    }

    public String getROLE() {
        return ROLE;
    }

    public void setROLE(String ROLE) {
        this.ROLE = ROLE;
    }

    public String getU_PICTURE() {
        return U_PICTURE;
    }

    public void setU_PICTURE(String u_PICTURE) {
        U_PICTURE = u_PICTURE;
    }

    @Override
    public String toString() {
        return "users{" +
                "U_ID='" + U_ID + '\'' +
                ", U_NAME='" + U_NAME + '\'' +
                ", U_LOGINNAME='" + U_LOGINNAME + '\'' +
                ", PASSWORD='" + PASSWORD + '\'' +
                ", U_PHONE='" + U_PHONE + '\'' +
                ", DEPARTMENT='" + DEPARTMENT + '\'' +
                ", ROLE='" + ROLE + '\'' +
                ", U_PICTURE='" + U_PICTURE + '\'' +
                '}';
    }
}
