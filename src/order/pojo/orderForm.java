package order.pojo;

import oracle.sql.DATE;

import java.util.Date;

public class orderForm {
    private int O_ID;
    private String O_NAME;
    private String  O_PHONE;
    private String O_PRICE;
    private String O_FNUM;
    private Date O_TIME;
    private String O_MENUNAEM;

    public orderForm(int o_ID, String o_NAME, String o_PHONE, String o_PRICE, String o_FNUM, Date o_TIME, String o_MENUNAEM) {
        O_ID = o_ID;
        O_NAME = o_NAME;
        O_PHONE = o_PHONE;
        O_PRICE = o_PRICE;
        O_FNUM = o_FNUM;
        O_TIME = o_TIME;
        O_MENUNAEM = o_MENUNAEM;
    }

    public orderForm() {
    }

    public int getO_ID() {
        return O_ID;
    }

    public void setO_ID(int o_ID) {
        O_ID = o_ID;
    }

    public String getO_NAME() {
        return O_NAME;
    }

    public void setO_NAME(String o_NAME) {
        O_NAME = o_NAME;
    }

    public String getO_PHONE() {
        return O_PHONE;
    }

    public void setO_PHONE(String o_PHONE) {
        O_PHONE = o_PHONE;
    }

    public String getO_PRICE() {
        return O_PRICE;
    }

    public void setO_PRICE(String o_PRICE) {
        O_PRICE = o_PRICE;
    }

    public String getO_FNUM() {
        return O_FNUM;
    }

    public void setO_FNUM(String o_FNUM) {
        O_FNUM = o_FNUM;
    }

    public Date getO_TIME() {
        return O_TIME;
    }

    public void setO_TIME(Date o_TIME) {
        O_TIME = o_TIME;
    }

    public String getO_MENUNAEM() {
        return O_MENUNAEM;
    }

    public void setO_MENUNAEM(String o_MENUNAEM) {
        O_MENUNAEM = o_MENUNAEM;
    }

    @Override
    public String toString() {
        return "orderForm{" +
                "O_ID=" + O_ID +
                ", O_NAME='" + O_NAME + '\'' +
                ", O_PHONE='" + O_PHONE + '\'' +
                ", O_PRICE='" + O_PRICE + '\'' +
                ", O_FNUM='" + O_FNUM + '\'' +
                ", O_TIME=" + O_TIME +
                ", O_MENUNAEM='" + O_MENUNAEM + '\'' +
                '}';
    }
}
