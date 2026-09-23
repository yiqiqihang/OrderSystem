package order.pojo;
import com.alibaba.fastjson.annotation.JSONField;
import oracle.sql.DATE;
import java.util.Date;

public class storage {

    private String S_ID;
    private String S_NAME;
    private String S_GENRE;
    private String S_UNIT;
    private String S_PRICE;
    private Date S_TIME;
    private String S_IMAGE;

    public storage() {
    }

    public storage(String s_ID, String s_NAME, String s_GENRE, String s_UNIT, String s_PRICE, Date s_TIME, String s_IMAGE) {
        S_ID = s_ID;
        S_NAME = s_NAME;
        S_GENRE = s_GENRE;
        S_UNIT = s_UNIT;
        S_PRICE = s_PRICE;
        S_TIME = s_TIME;
        S_IMAGE = s_IMAGE;
    }

    public String getS_ID() {
        return S_ID;
    }

    public void setS_ID(String s_ID) {
        S_ID = s_ID;
    }

    public String getS_NAME() {
        return S_NAME;
    }

    public void setS_NAME(String s_NAME) {
        S_NAME = s_NAME;
    }

    public String getS_GENRE() {
        return S_GENRE;
    }

    public void setS_GENRE(String s_GENRE) {
        S_GENRE = s_GENRE;
    }

    public String getS_UNIT() {
        return S_UNIT;
    }

    public void setS_UNIT(String s_UNIT) {
        S_UNIT = s_UNIT;
    }

    public String getS_PRICE() {
        return S_PRICE;
    }

    public void setS_PRICE(String s_PRICE) {
        S_PRICE = s_PRICE;
    }

    public Date getS_TIME() {
        return S_TIME;
    }

    public void setS_TIME(Date s_TIME) {
        S_TIME = s_TIME;
    }

    public String getS_IMAGE() {
        return S_IMAGE;
    }

    public void setS_IMAGE(String s_IMAGE) {
        S_IMAGE = s_IMAGE;
    }

    @Override
    public String toString() {
        return "storage{" +
                "S_ID='" + S_ID + '\'' +
                ", S_NAME='" + S_NAME + '\'' +
                ", S_GENRE='" + S_GENRE + '\'' +
                ", S_UNIT='" + S_UNIT + '\'' +
                ", S_PRICE='" + S_PRICE + '\'' +
                ", S_TIME=" + S_TIME +
                ", S_IMAGE='" + S_IMAGE + '\'' +
                '}';
    }
}
