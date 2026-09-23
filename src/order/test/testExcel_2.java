package order.test;


import java.util.UUID;

public class testExcel_2 {
    public static final String[] TestToXls = { "编号","设计人员工号", "设计人员姓名","开发人员工号", "开发人员姓名", "测试人员工号", "测试人员姓名"};
    private static final UUID UUID = java.util.UUID.randomUUID();

//    public void toExcel() {
//        //这里为导出文件存放的路径
//        String filePath ="D:\\temp\\test" + UUID.randomUUID() + "\\";
//        //加入一个uuid随机数是因为
//        //每次导出的时候，如果文件存在了，会将其覆盖掉，这里是保存所有的文件
//        File file = new File(filePath);
//        if (!file.exists()) {
//            file.mkdirs();
//        }
//
//        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
//        // 给要导出的文件起名为 "测试导出数据表_时间.xls"
//        String filePath2 = filePath + "测试导出数据表" + "_" + fmt.format(new Date()) + ".xls";
//        WritableWorkbook wb = null;
//        try {
//            File file2 = new File(filePath2);
//            if (!file2.exists()) {//不存在，创建
//                file2.createNewFile();
//            }
////            wb = Workbook.createWorkbook(file2);//创建xls表格文件
//
//            // 表头显示
//            WritableCellFormat wcf = new WritableCellFormat();
//            wcf.setAlignment(Alignment.CENTRE);// 水平居中
//            wcf.setWrap(true);
//            wcf.setVerticalAlignment(VerticalAlignment.CENTRE);// 垂直居中
//            wcf.setFont(new WritableFont(WritableFont.TIMES,13, WritableFont.BOLD));// 表头字体 加粗 13号
//            wcf.setBackground(jxl.format.Colour.PERIWINKLE);
//            // 内容显示
//            WritableCellFormat wcf2 = new WritableCellFormat();
//            wcf2.setWrap(true);//设置单元格可以换行
//            wcf2.setAlignment(Alignment.CENTRE);//水平居中
//            wcf2.setVerticalAlignment(VerticalAlignment.CENTRE);// 垂直居中
//            wcf2.setFont( new WritableFont(WritableFont.TIMES,11));// 内容字体 11号
//
//            //导出的xls的第一页，第二页就是0换成1，“sheet1”，也可以修改为自己想要的显示的内容
//            WritableSheet ws = wb.createSheet("sheet1", 0);
//            //WritableSheet ws2 = wb.createSheet("sheet2", 1);//第2个sheet页
//            ws.addCell(new Label(0,0, "导出结果"));//代表着表格中第一列的第一行显示查询结果几个字
//
//            // 导出时生成表头
//            for (int i = 0; i < TestToXls.length; i++) {
//                //i,代表的第几列，1，代表第2行，第三个参数为要显示的内容，第四个参数，为内容格式设置（按照wcf的格式显示）
//                ws.addCell(new Label(i, 1, TestToXls[i],wcf));//在sheet1中循环加入表头
//            }
//
//            //查询出来的数据,这个方法是演示所用
//            String sql="order.mapper.recipeMapper.findAllUser";//sql为mybatis框架下的路径
//            Map<String, Object> map = new HashMap<String, Object>();//map里为存放前台的条件
//            map.put("prnte",  this.getParameter("prnteTest"));
//            List<Test> listTest = TestService.findAllList(sql, map);
//            int k =2 ;//从第三行开始写入数据
//
//            for (int i = 0; i < listTest.size(); i++) {
//                ws.addCell(new Label(0, k, listTest.get(i).getIdd(), wcf2));
//                ws.addCell(new Label(1, k, listTest.get(i).getDesignId(),wcf2));
//                ws.addCell(new Label(2, k, listTest.get(i).getDesignName(),wcf2));
//                ws.addCell(new Label(3, k, listTest.get(i).getDevelopId(),wcf2));
//                ws.addCell(new Label(4, k, listTest.get(i).getDevelopName(),wcf2));
//                ws.addCell(new Label(5, k, listTest.get(i).getTestId(),wcf2));
//                ws.addCell(new Label(6, k, listTest.get(i).getTestName(),wcf2));
//                //ws.mergeCells(4, 5, 5, 5);//合并两列，按参数顺序，意思是第4列的第五行，跟第五列的第五行合并为一个单元格
//                k++;
//            }
//            wb.write();//写入，到这里已经生成完成，可以在相应目录下找到刚才生成的文件
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (JxlWriteException e) {
//            e.printStackTrace();
//        } catch (WriteException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (wb != null) {
//                    wb.close();
//                }
//            } catch (WriteException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        //这个是我们项目中，是把刚才生成的文件，响应到前台，进行下载、保存，可省略。
//        downLoadFile(filePath2);
//    }
}
