package order.pojo;

public class pageInfo {
    private int start;
    private int limit;

    public pageInfo(int start, int limit) {
        this.start = start;
        this.limit = limit;
    }

    public pageInfo() {

    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
