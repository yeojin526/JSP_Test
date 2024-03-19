package jdbc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Board;


public class BoardDao {
		private static Connection conn;
		private static BoardDao dao = new BoardDao();
		private BoardDao() {} // 생성자
		public static BoardDao getInstance() {
			BoardDao.getConnection();
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
		
		public ArrayList<Board> selectList() {
			ArrayList<Board> list = new ArrayList<>();
			String sql = "select * from board order by num desc";
			PreparedStatement pstmt;
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Board board = new Board(
							rs.getInt("num"), 
							rs.getString("title"), 
							rs.getString("content"),
							rs.getString("writer"),
							rs.getString("regtime"), 
							rs.getInt("hits"));		
							
					list.add(board);
				}
				System.out.println("-------전체 게시글 로딩 완료");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public Board selectOne(int num, boolean inc) {
			Board board = null;
			String sql = "select * from board where num = ?";
			PreparedStatement pstmt;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				ResultSet rs = pstmt.executeQuery();
				
				if (rs.next()) {
					board = new Board(
							rs.getInt("num"), 
							rs.getString("title"), 
							rs.getString("content"),
							rs.getString("writer"),
							rs.getString("regtime"), 
							rs.getInt("hits"));
					System.out.println(num+"번 게시글 로딩 완료");
				}
				
				if (inc) {
					pstmt.executeUpdate("update board set hits=hits+1 where num="+num);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return board;
			
		}
		
		public int delete(int num) {
			int result = 0;
			try ( 
			        PreparedStatement pstmt = conn.prepareStatement(
			        		"delete from board where num=" + num);
			    ) {
			        // 쿼리 실행
					result = pstmt.executeUpdate();
			        System.out.println("-------"+ num + "번 게시글 삭제 완료");
			    } catch(Exception e) {
			        e.printStackTrace();
			    }
			return result;
		}
		
		public int insert(Board board) {
			String sql = "insert into board(num, title, content, writer, regtime, hits) values (seq_board.nextval,?,?,?,sysdate,0)";
		    try ( 
		        PreparedStatement pstmt = conn.prepareStatement(sql);            
		    ) {
		        // 현재 시간 얻기
//		        String curTime = LocalDate.now() + " " + 
//		                         LocalTime.now().toString().substring(0, 8);
		        
		        // 쿼리 실행
		    	pstmt.setString(1, board.getTitle());
		    	pstmt.setString(2, board.getContent());
		    	pstmt.setString(3, board.getWriter());
		    	
		    	System.out.println("-------"+board.getWriter()+"님의 게시글 등록 완료");
		    	
		        return pstmt.executeUpdate();
		    
		    } catch(Exception e) {
		        e.printStackTrace();
		    } 
			return 0;
		}
		
		public int update(Board board) {
	        String sql = "update board set title=?, content=?, regtime=sysdate where num=?";
		    try ( 
		        PreparedStatement pstmt = conn.prepareStatement(sql);            
		    ) {

		        // 쿼리 실행
		    	pstmt.setString(1, board.getTitle());
		    	pstmt.setString(2, board.getContent());
		    	pstmt.setInt(3, board.getNum());
		    	
		        System.out.println("-------"+board.getNum() + "번 게시글 수정 완료");
		    	
		        return pstmt.executeUpdate();
		        
		    } catch(Exception e) {
		        e.printStackTrace();
		    } 
			return 0;
		}
		
	}