package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class User2DAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public User2DAO() {
		String DB_URL = "jdbc:oracle:thin:@192.168.0.03:1521:xe";
		String DB_USER = "c##team4";
		String DB_PASSWORD = "min";
		
		// 드라이버 로드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<User2> getList(){
		String sql = "select u_no, u_id, u_pw, u_name, u_gender, u_age, u_loc, u_hobby, u_talent, u_mbti, u_like, UTL_RAW.CAST_TO_VARCHAR2(u_img) from user_info";
		ArrayList<User2> list = new ArrayList<User2>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	
	public int login(String userID, String userPassword) {
		String sql = "SELECT u_pw FROM user_info WHERE u_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
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
		return -2; // 데이터베이스 오류
	}
	
	public int join(User2 user) {
		String SQL = "insert into user_info(u_no, u_id, u_pw, u_name, u_gender, u_age, u_loc, u_hobby, u_talent, u_mbti, u_img) values(u_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, UTL_RAW.CAST_TO_RAW(?))";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, user.getU_pw());
			pstmt.setString(3, user.getU_name());
			pstmt.setString(4, user.getU_gender());
			pstmt.setInt(5, user.getU_age());
			pstmt.setString(6, user.getU_loc());
			pstmt.setString(7, user.getU_hobby());
			pstmt.setString(8, user.getU_talent());
			pstmt.setString(9, user.getU_mbti());
			pstmt.setString(10, user.getU_img());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return -1;
	}
	
	
	public ArrayList<User2> getUserinfo(String userID) {
		String sql = "select u_no, u_id, u_pw, u_name, u_gender, u_age, u_loc, u_hobby, u_talent, u_mbti, u_like, UTL_RAW.CAST_TO_VARCHAR2(u_img) from user_info where u_id = ?";
		ArrayList<User2> list = new ArrayList<User2>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {

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
			System.out.println("사용자 정보 불러오기 실패");
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
	
	public int update(User2 user) {
		String SQL = "UPDATE USER_INFO SET u_pw=?,u_name=?, u_gender=?, u_age=?, u_loc=?, u_hobby=?, u_talent=?, u_mbti=? WHERE u_id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getU_pw());
			pstmt.setString(2, user.getU_name());
			pstmt.setString(3, user.getU_gender());
			pstmt.setInt(4, user.getU_age());
			pstmt.setString(5, user.getU_loc());
			pstmt.setString(6, user.getU_hobby());
			pstmt.setString(7, user.getU_talent());
			pstmt.setString(8, user.getU_mbti());
			pstmt.setString(9, user.getU_id());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return -1;
	}
	
	
}
