package board;

public class Board {
    private int b_no;
    private String b_title;
    private String b_content;
    private String u_id;
    private int b_hit;
    private String b_date;

    public void setNo(int b_no) {
        this.b_no = b_no;
    }
    public void setTitle(String b_title) {
        this.b_title = b_title;
    }
    public void setContent(String b_content) {
        this.b_content = b_content;
    }
    public void setId(String u_id) {
        this.u_id = u_id;
    }
    public void setHit(int b_hit) {
        this.b_hit=b_hit;
    }
    public void setDate(String b_date) {
        this.b_date = b_date;
    }

    public int getNo() {
        return b_no;
    }
    public String getTitle() {
        return b_title;
    }
    public String getContent() {
        return b_content;
    }
    public String getId() {
        return u_id;
    }
    public int getHit() {
        return b_hit;
    }
    public String getDate() {
        return b_date;
    }

}