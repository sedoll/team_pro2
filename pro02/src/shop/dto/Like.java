package shop.dto;

public class Like {
    private String userid;
    private String productid;
    private String liketime;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getLiketime() {
        return liketime;
    }

    public void setLiketime(String liketime) {
        this.liketime = liketime;
    }

    @Override
    public String toString() {
        return "Like{" +
                "userid='" + userid + '\'' +
                ", productid='" + productid + '\'' +
                ", liketime='" + liketime + '\'' +
                '}';
    }
}
