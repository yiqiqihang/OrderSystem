package order.pojo;

import java.math.BigDecimal;

public class blanketOrder {
    private String name;
    private BigDecimal SUM;

    public blanketOrder(String OM_NAME, BigDecimal SUM) {
        this.name = OM_NAME;
        this.SUM = SUM;
    }

    public blanketOrder() {
    }

    public String getOM_NAME() {
        return name;
    }

    public void setOM_NAME(String OM_NAME) {
        this.name = OM_NAME;
    }

    public BigDecimal getSUM() {
        return SUM;
    }

    public void setSUM(BigDecimal SUM) {
        this.SUM = SUM;
    }

    @Override
    public String toString() {
        return "blanketOrder{" +
                "OM_NAME='" + name + '\'' +
                ", SUM=" + SUM +
                '}';
    }
}
