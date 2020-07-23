package relation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.User2;
import user.User2DAO;

public class RelationDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public RelationDAO() {
		String DB_URL = "jdbc:oracle:thin:@192.168.0.03:1521:xe";
		String DB_USER = "c##team4";
		String DB_PASSWORD = "min";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<User2> get_RList(String mtype, int star, String myid) {
		String sql = "select u_no, u_id, u_pw, u_name, u_gender, u_age, u_loc, u_hobby, u_talent, u_mbti, u_like, UTL_RAW.CAST_TO_VARCHAR2(u_img) from user_info where u_mbti in\r\n" + 
				"(select r_type2\r\n" + 
				"from relation \r\n" + 
				"where r_type1 = (select u_mbti from user_info where u_id = ?) and r_level = ? ) and u_id != ?";
		ArrayList<User2> list = new ArrayList<User2>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mtype);
			pstmt.setInt(2, star);
			pstmt.setString(3, myid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User2 user2 = new User2();
				user2.setU_no(rs.getInt(1));
				user2.setU_id(rs.getString(2));
				user2.setU_pw(rs.getString(3));
				user2.setU_name(rs.getString(4));
				user2.setU_gender(rs.getString(5));
				user2.setU_age(rs.getInt(6));
				user2.setU_loc(rs.getString(7));
				user2.setU_hobby(rs.getString(8));
				user2.setU_talent(rs.getString(9));
				user2.setU_mbti(rs.getString(10));
				user2.setU_like(rs.getInt(11));
				user2.setU_img(rs.getString(12));

				list.add(user2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}