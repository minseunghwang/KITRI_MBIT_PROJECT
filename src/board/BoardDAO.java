package board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class BoardDAO {

    public static Connection getConnection() {
        Connection conn =null;
        String DB_URL = "jdbc:oracle:thin:@192.168.0.03:1521:xe";
		String DB_USER = "c##team4";
		String DB_PASSWORD = "min";

        try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}

        return conn;
    }
    
    public static int getTotalRows() {
        int cnt = 0;
        try {
            Connection conn = getConnection();
            String selectRows = "SELECT COUNT(*) cnt FROM board";
            PreparedStatement pstmt2 = conn.prepareStatement(selectRows);
            ResultSet rs = pstmt2.executeQuery();

            if (rs.next()) {
                cnt = rs.getInt("cnt");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return cnt;
    }


    public static List<Board> getRows(int start, int end) {
        List<Board> list = new ArrayList<Board>();
        try {
            Connection conn = getConnection();
            String selectList = "SELECT * from ( SELECT ROWNUM AS row_num, board.* FROM ( SELECT b_no, b_title, b_content, u_id, b_hit, case to_char(b_date, 'yy/mm/dd') when to_char(sysdate, 'yy/mm/dd') then to_char(b_date,'hh24:mi:ss') else to_char(b_date,'yy/mm/dd') end regdate FROM board ORDER BY b_no DESC ) board ) WHERE row_num >= " + start + " AND row_num <=" + end;
            PreparedStatement pstmt = conn.prepareStatement(selectList);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) { 
                Board b = new Board();
                b.setNo(rs.getInt("b_no"));
                b.setTitle(rs.getString("b_title"));
                b.setContent(rs.getString("b_content"));
                b.setId(rs.getString("u_id"));
                b.setHit(rs.getInt("b_hit"));
                b.setDate(rs.getString("regdate"));
                list.add(b);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}