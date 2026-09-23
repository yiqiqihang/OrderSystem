package order.pojo;

import oracle.sql.NUMBER;

public class recipe {

    private int R_ID;
	private String R_NAME;
	private String R_GENRE;
	private String R_UNIT;
	private String R_PRICE;
	private  String R_INSTRUCTION;
	private String R_IMAGE;

    public recipe(int r_ID, String r_NAME, String r_GENRE, String r_UNIT, String r_PRICE, String r_INSTRUCTION,String r_IMAGE) {
        R_ID = r_ID;
        R_NAME = r_NAME;
        R_GENRE = r_GENRE;
        R_UNIT = r_UNIT;
        R_PRICE = r_PRICE;
        R_INSTRUCTION = r_INSTRUCTION;
        R_IMAGE = r_IMAGE;
    }


    public recipe() {
    }

    public int getR_ID() {
        return R_ID;
    }

    public void setR_ID(int r_ID) {
        R_ID = r_ID;
    }


    public String getR_NAME() {
        return R_NAME;
    }

    public void setR_NAME(String r_NAME) {
        R_NAME = r_NAME;
    }

    public String getR_GENRE() {
        return R_GENRE;
    }

    public void setR_GENRE(String r_GENRE) {
        R_GENRE = r_GENRE;
    }

    public String getR_UNIT() {
        return R_UNIT;
    }

    public void setR_UNIT(String r_UNIT) {
        R_UNIT = r_UNIT;
    }

    public String getR_PRICE() {
        return R_PRICE;
    }

    public void setR_PRICE(String r_PRICE) {
        R_PRICE = r_PRICE;
    }

    public String getR_INSTRUCTION() {
        return R_INSTRUCTION;
    }

    public void setR_INSTRUCTION(String r_INSTRUCTION) {
        R_INSTRUCTION = r_INSTRUCTION;
    }

    public String getR_IMAGE() {
        return R_IMAGE;
    }

    public void setR_IMAGE(String r_IMAGE) {
        R_IMAGE = r_IMAGE;
    }

    @Override
    public String toString() {
        return "recipe{" +
                "R_ID=" + R_ID +
                ", R_NAME='" + R_NAME + '\'' +
                ", R_GENRE='" + R_GENRE + '\'' +
                ", R_UNIT='" + R_UNIT + '\'' +
                ", R_PRICE='" + R_PRICE + '\'' +
                ", R_INSTRUCTION='" + R_INSTRUCTION + '\'' +
                ", R_IMAGE='" + R_IMAGE + '\'' +
                '}';
    }

}

