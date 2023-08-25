package shop.dto;

public class Qna {
    private int qno;
    private String title;
    private String content;
    private String cid;
    private String resdate;
    private int cnt;
    private int lev;
    private int par;

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public int getLev() {
        return lev;
    }

    public void setLev(int lev) {
        this.lev = lev;
    }

    public int getPar() {
        return par;
    }

    public void setPar(int par) {
        this.par = par;
    }

    @Override
    public String toString() {
        return "Qna{" +
                "qno=" + qno +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", cid='" + cid + '\'' +
                ", resdate='" + resdate + '\'' +
                ", cnt=" + cnt +
                ", lev=" + lev +
                ", par=" + par +
                '}';
    }
}
