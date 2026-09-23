package order.pojo;

import java.util.Date;

public class orderPerson {
    private String O_ID;
    private String O_NAME;
    private String O_PHONE;
    private Date O_TIME;
    private String OM_NAME;
    private String OM_WEIGHT;
    private String OM_UNIT;
    private String OM_PRICE;
    private String ALL_PRICE;
    private String O_PRICE;

    public orderPerson(String o_ID, String o_NAME, String o_PHONE, Date o_TIME, String OM_NAME, String OM_WEIGHT, String OM_UNIT, String OM_PRICE, String ALL_PRICE, String o_PRICE) {
        O_ID = o_ID;
        O_NAME = o_NAME;
        O_PHONE = o_PHONE;
        O_TIME = o_TIME;
        this.OM_NAME = OM_NAME;
        this.OM_WEIGHT = OM_WEIGHT;
        this.OM_UNIT = OM_UNIT;
        this.OM_PRICE = OM_PRICE;
        this.ALL_PRICE = ALL_PRICE;
        this.O_PRICE = o_PRICE;
    }

    public orderPerson() {
    }

    public String getO_ID() {
        return O_ID;
    }

    public void setO_ID(String o_ID) {
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

    public Date getO_TIME() {
        return O_TIME;
    }

    public void setO_TIME(Date o_TIME) {
        O_TIME = o_TIME;
    }

    public String getOM_NAME() {
        return OM_NAME;
    }

    public void setOM_NAME(String OM_NAME) {
        this.OM_NAME = OM_NAME;
    }

    public String getOM_WEIGHT() {
        return OM_WEIGHT;
    }

    public void setOM_WEIGHT(String OM_WEIGHT) {
        this.OM_WEIGHT = OM_WEIGHT;
    }

    public String getOM_UNIT() {
        return OM_UNIT;
    }

    public void setOM_UNIT(String OM_UNIT) {
        this.OM_UNIT = OM_UNIT;
    }

    public String getOM_PRICE() {
        return OM_PRICE;
    }

    public void setOM_PRICE(String OM_PRICE) {
        this.OM_PRICE = OM_PRICE;
    }

    public String getALL_PRICE() {
        return ALL_PRICE;
    }

    public void setALL_PRICE(String ALL_PRICE) {
        this.ALL_PRICE = ALL_PRICE;
    }

    public String getO_PRICE() {
        return O_PRICE;
    }

    public void setO_PRICE(String o_PRICE) {
        O_PRICE = o_PRICE;
    }

    @Override
    public String toString() {
        return "orderPerson{" +
                "O_ID='" + O_ID + '\'' +
                ", O_NAME='" + O_NAME + '\'' +
                ", O_PHONE='" + O_PHONE + '\'' +
                ", O_TIME=" + O_TIME +
                ", OM_NAME='" + OM_NAME + '\'' +
                ", OM_WEIGHT='" + OM_WEIGHT + '\'' +
                ", OM_UNIT='" + OM_UNIT + '\'' +
                ", OM_PRICE='" + OM_PRICE + '\'' +
                ", ALL_PRICE='" + ALL_PRICE + '\'' +
                ", O_PRICE='" + O_PRICE + '\'' +
                '}';
    }
}
