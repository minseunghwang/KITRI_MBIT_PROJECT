package relation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	public ArrayList<Relation> get_RList(String mtype) {
		String sql_mbti = "select * from relation where r_type1 = (select u_mbti from user_info where u_id = ?)";
		ArrayList<Relation> list = new ArrayList<Relation>();
		try {
			pstmt = conn.prepareStatement(sql_mbti);
			pstmt.setString(1, mtype);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Relation rel = new Relation();
				rel.setR_no(rs.getInt(1));
				rel.setR_type1(rs.getString(2));
				rel.setR_type2(rs.getString(3));
				rel.setR_level(rs.getInt(4));

				list.add(rel);
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