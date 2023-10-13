package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BoardDao {
	//BoardDao 싱글톤 객체 생성
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static BoardDao instance = new BoardDao();

	private BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static BoardDao getInstance() {
		//		if(instance==null) {
		//			instance = new BoardDao();
		//		}

		return instance;
	}//getInstance

	public ArrayList<BoardBean> getArticles(int start, int end){

		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();

		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";	

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(writer);
				bb.setEmail(email);
				bb.setSubject(subject);
				bb.setPasswd(passwd);
				bb.setReg_date(reg_date);
				bb.setReadcount(readcount);
				bb.setRef(ref);
				bb.setRe_step(re_step);
				bb.setRe_level(re_level);
				bb.setContent(content);
				bb.setIp(ip);

				lists.add(bb);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			try {
//				if(ps != null) 
//					ps.close();
//				if(rs != null)
//					rs.close();
//			}catch(SQLException e) {
//			}
		}
		return lists;
	}//getArticles

	public int getArticleCount() {
		String sql = "select count(*) as cnt from board";
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			try {
//				if(ps!=null) {
//					ps.close();
//				}
//				if(rs!=null) {
//					rs.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
		}
		return count;
	}//getArticleCount
	
	public int insertArticle(BoardBean bb) { // 원글쓰기
		int cnt = -1;
		String sql = "insert into board(num,writer,email,subject,passwd,"
				+ "reg_date,ref,re_step,re_level,content,ip) "
				+ "values(board_seq.nextval,?,?,?,?,?,board_seq.currval,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getEmail());
			ps.setString(3, bb.getSubject());
			ps.setString(4, bb.getPasswd());
			ps.setTimestamp(5,bb.getReg_date());
			
			ps.setInt(6, 0);
			ps.setInt(7, 0);
			ps.setString(8, bb.getContent());
			ps.setString(9, bb.getIp());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	//			try {
	//			if(ps != null) {
	//				ps.close();
	//			}
	//			if(rs != null) {
	//				rs.close();
	//			}
	//		}catch(Exception e) {
	//			e.printStackTrace();
	//		}
		}
		return cnt;
	}//insertArticle
	
	public BoardBean SelectNum(int num) {
		BoardBean bb =new BoardBean();
		String sql = "select * from board where num= ?";
		String sql2 = "update board set readcount = readcount+1 where num=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, num);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNum(rs.getInt(num));
				bb.setWriter(rs.getString("writer"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			try {
//				if(ps!=null) {
//					ps.close();
//				}
//				if(rs!=null) {
//					rs.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
		}
		
		return bb;
	}
}