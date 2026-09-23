package order.pojo;

import java.util.Date;

public class orderMeal {
    private String OM_ID;
    private String OM_NAME;
    private String OM_WEIGHT;
    private String OM_UNIT;
    private String OM_PRICE;
    private String ALL_PRICE;
    private Date OM_TIME;
    private String U_NAME;

    public orderMeal(String OM_ID, String OM_NAME, String OM_WEIGHT, String OM_UNIT, String OM_PRICE, String ALL_PRICE, Date OM_TIME, String u_NAME) {
        this.OM_ID = OM_ID;
        this.OM_NAME = OM_NAME;
        this.OM_WEIGHT = OM_WEIGHT;
        this.OM_UNIT = OM_UNIT;
        this.OM_PRICE = OM_PRICE;
        this.ALL_PRICE = ALL_PRICE;
        this.OM_TIME = OM_TIME;
        U_NAME = u_NAME;
    }

    public orderMeal() {
    }

    public String getOM_ID() {
        return OM_ID;
    }

    public void setOM_ID(String OM_ID) {
        this.OM_ID = OM_ID;
    }

    public String getOM_NAME() {
        return OM_NAME;
    }

    public void setOM_NAME(String oM_NAME) {
        this.OM_NAME = oM_NAME;
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

    public Date getOM_TIME() {
        return OM_TIME;
    }

    public void setOM_TIME(Date OM_TIME) {
        this.OM_TIME = OM_TIME;
    }

    public String getU_NAME() {
        return U_NAME;
    }

    public void setU_NAME(String u_NAME) {
        U_NAME = u_NAME;
    }

    @Override
    public String toString() {
        return "orderMeal{" +
                "OM_ID='" + OM_ID + '\'' +
                ", oM_NAME='" + OM_NAME + '\'' +
                ", OM_WEIGHT='" + OM_WEIGHT + '\'' +
                ", OM_UNIT='" + OM_UNIT + '\'' +
                ", OM_PRICE='" + OM_PRICE + '\'' +
                ", ALL_PRICE='" + ALL_PRICE + '\'' +
                ", OM_TIME=" + OM_TIME +
                ", U_NAME='" + U_NAME + '\'' +
                '}';
    }
}
