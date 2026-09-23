package order.util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

public class UploadFileUtil {

    public static String uploadFile(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        //创建一个磁盘文件项工厂类
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建一个核心解析对象
        ServletFileUpload upload = new ServletFileUpload(factory);
        //设置文件的文件编码
        upload.setHeaderEncoding("utf-8");
        //解析request
        try {
            List<FileItem> fileItems = upload.parseRequest(req);

            for (FileItem fileitem : fileItems) {
                //判断是否是一个要上传的文件，因为有可能是普通表单
                if (fileitem.isFormField()) {
                    //普通项，是不用处理上传的
                    String name = fileitem.getFieldName();
                    String value = fileitem.getString("utf-8");
                    System.out.println("name==" + name + ",value==" + value);
                } else {
                    String fileName = fileitem.getName();
                    if (!fileName.equals("")) {
                        System.out.println("上传的文件名：" + fileName);
//                        //要处理文件重名问题，建议使用时间戳拼接或者用UUID编码（是一个工具类，产生的数据不会重复，重复1亿年）
//                        String uuid = UUID.randomUUID().toString();
//                        fileName = uuid + "_" + fileName;
                        System.out.println(fileName);
                        //得到一个输入流
                        BufferedInputStream in = new BufferedInputStream(fileitem.getInputStream());
                        //读取后要给定一个路径来保存文件
                        String path = req.getServletContext().getRealPath("/images");
                        //如果文件夹不存在，则需要创建一个文件夹
                        File file = new File(path);
                        if (!file.exists()) {
                            file.mkdir();//创建文件夹
                        }
                        System.out.println("保存的地址：" + path);

                        //将文件保存到指定的目录
                        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + "/" + fileName));
                        //循环的存放
                        byte[] by = new byte[1024 * 4];
                        int len = 0;
                        while ((len = in.read(by)) != -1) {
                            bos.write(by, 0, len);
                        }
                        bos.close();
                        in.close();
                        fileitem.delete();
                        System.out.println("上传成功");

                        return fileName;
                    }
                }

            }

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        return null;
    }

}