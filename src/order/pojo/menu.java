package order.pojo;

import java.util.Date;

public class menu {

    private int M_ID;
    private String M_NAME;
    private String M_GENRE;
    private String M_UNIT;
    private String M_PRICE;
    private String M_IMAGE;
    private Date M_TIME;

    public menu(int m_ID, String m_NAME, String m_GENRE, String m_UNIT, String m_PRICE, String m_IMAGE, Date m_TIME) {
        M_ID = m_ID;
        M_NAME = m_NAME;
        M_GENRE = m_GENRE;
        M_UNIT = m_UNIT;
        M_PRICE = m_PRICE;
        M_IMAGE = m_IMAGE;
        M_TIME = m_TIME;
    }

    public menu() {
    }

    public int getM_ID() {
        return M_ID;
    }

    public void setM_ID(int m_ID) {
        M_ID = m_ID;
    }

    public String getM_NAME() {
        return M_NAME;
    }

    public void setM_NAME(String m_NAME) {
        M_NAME = m_NAME;
    }

    public String getM_GENRE() {
        return M_GENRE;
    }

    public void setM_GENRE(String m_GENRE) {
        M_GENRE = m_GENRE;
    }

    public String getM_UNIT() {
        return M_UNIT;
    }

    public void setM_UNIT(String m_UNIT) {
        M_UNIT = m_UNIT;
    }

    public String getM_PRICE() {
        return M_PRICE;
    }

    public void setM_PRICE(String m_PRICE) {
        M_PRICE = m_PRICE;
    }

    public String getM_IMAGE() {
        return M_IMAGE;
    }

    public void setM_IMAGE(String m_IMAGE) {
        M_IMAGE = m_IMAGE;
    }

    public Date getM_TIME() {
        return M_TIME;
    }

    public void setM_TIME(Date m_TIME) {
        M_TIME = m_TIME;
    }

    @Override
    public String toString() {
        return "menu{" +
                "M_ID=" + M_ID +
                ", M_NAME='" + M_NAME + '\'' +
                ", M_GENRE='" + M_GENRE + '\'' +
                ", M_UNIT='" + M_UNIT + '\'' +
                ", M_PRICE='" + M_PRICE + '\'' +
                ", M_IMAGE='" + M_IMAGE + '\'' +
                ", M_TIME=" + M_TIME +
                '}';
    }
}
