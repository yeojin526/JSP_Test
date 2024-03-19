package jdbc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dto.Board;
import dto.MemberVo;
import jdbc.JdbcUtil;

public class MemberDao {
	private static Connection conn;
	private static MemberVo member = null;
	private static MemberDao dao = new MemberDao();
	private MemberDao() {} // 생성자
	
	public static MemberDao getInstance() {
		MemberDao.getConnection();
		return dao;
	}
	
	private static void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
	}
	
	
	public MemberVo selectForLogin(String id, String email) {
		PreparedStatement pstmt;
		String sql = "select * from p2_mem where id = ? and email = ?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			ResultSet rs = pstmt.executeQuery(); 
			if (rs.next()) {
				member = new MemberVo(
						rs.getInt("MEMBERNO"),
						rs.getString("ID"), 
						rs.getString("EMAIL"),
						rs.getString("NICKNAME")
						);
				System.out.println(member);
			}
		} catch (SQLException | NullPointerException e) {  
			e.printStackTrace();
		}
		return member; 
		
	}
	
	
	public ArrayList<MemberVo> selectMembers() {
		ArrayList<MemberVo> list = new ArrayList<>();
		String sql = "select *  from p2_mem";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVo member = new MemberVo(
						rs.getInt("memberno"),
						rs.getString("id"), 
						rs.getString("email"),
			            rs.getString("nickname"));
				
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return list;
	}
	
	
	public MemberVo selectId(String id) {
		MemberVo member = null;
		ResultSet rs = null;
		String sql = "select * from p2_mem where id = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {	
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberVo(rs.getInt("MEMBERNO"),
						            rs.getString("ID"),
						            rs.getString("EMAIL"),
						            rs.getString("NICKNAME"));
				System.out.println(member+"선택 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
		}
		return member;
		
	}
	
	
	
	public MemberVo selectNum(int memberno) {
		MemberVo member = null;
		ResultSet rs = null;
		String sql = "select * from p2_mem where memberno = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {	
			pstmt.setInt(1, memberno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberVo(rs.getInt("MEMBERNO"),
						            rs.getString("ID"),
						            rs.getString("EMAIL"),
						            rs.getString("NICKNAME"));
				System.out.println(member+"선택 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
		}
		return member;
		
	}
	
	
	public int insert(MemberVo member) {
		
		String sql = "insert into p2_mem(memberno, id, email, nickname) values (seq_member.nextval,?,?,?)";
	    try ( 
	        PreparedStatement pstmt = conn.prepareStatement(sql);            
	    ) {
	        
	        // 쿼리 실행
	    	pstmt.setString(1, member.getId());
	    	pstmt.setString(2, member.getEmail());
	    	pstmt.setString(3, member.getNickname());
	    	
	    	System.out.println("등록 완료");
	        return pstmt.executeUpdate();
	        
	        
	    } catch(Exception e) {
	        e.printStackTrace();
	    } 
		return 0;
	}
	
	public int update(MemberVo member) {
		String sql = "update p2_mem set email = ?, nickname = ? where id = ?";
	    try ( 
	        PreparedStatement pstmt = conn.prepareStatement(sql);            
	    ) {
	        
	        // 쿼리 실행
	    	pstmt.setString(3, member.getId());
	    	pstmt.setString(1, member.getEmail());
	    	pstmt.setString(2, member.getNickname());
	        return pstmt.executeUpdate();
	    
	    } catch(Exception e) {
	        e.printStackTrace();
	    } 
		return 0;
	}
	
	public int delete(int memberno) {
		String sql = "delete from p2_mem where memberno = ?";
	    try ( 
	        PreparedStatement pstmt = conn.prepareStatement(sql);            
	    ) {
	        
	        // 쿼리 실행
	    	pstmt.setInt(1, memberno);
	        return pstmt.executeUpdate();
	    
	    } catch(Exception e) {
	        e.printStackTrace();
	    } 
		return 0;
	}
	
	
}





