package order.pojo;

import javax.swing.*;

public class connectNew {
    private  String connectNew;

    public connectNew(String connectNew) {
        this.connectNew = connectNew;
    }

    public connectNew() {
    }

    public String getConnectNew() {
        return connectNew;
    }

    public void setConnectNew(String connectNew) {
        this.connectNew = connectNew;
    }

    @Override
    public String toString() {
        return "connectNew{" +
                "connectNew='" + connectNew + '\'' +
                '}';
    }
}
