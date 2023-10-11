package mypkg;

import java.sql.*;
import java.util.ArrayList;

public class BookDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String sqlid = "sqlid";
	String sqlpw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps =null;
	public BookDao() {
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, sqlid, sqlpw);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}//생성자
	public ArrayList<BookBean> bookselect() {
		String sql="select * from book order by no";
		ArrayList<BookBean> lists = new ArrayList<BookBean>();
		ResultSet rs = null;
		try {
			ps= conn.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				String day = String.valueOf(rs.getDate("day"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int price = rs.getInt("price");
				int count = rs.getInt("count");
				BookBean bb = new BookBean();
				bb.setAuthor(author);
				bb.setBookstore(bookstore);
				bb.setCount(count);
				bb.setDay(day);
				bb.setKind(kind);
				bb.setNo(no);
				bb.setPrice(price);
				bb.setPublisher(publisher);
				bb.setTitle(title);
				lists.add(bb);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if (conn != null){
					conn.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return lists;
	}
	public int insertbook(BookBean bb) {
		int cnt=-1;
		System.out.print(bb.getTitle()+bb.getAuthor()+bb.getPublisher()+bb.getPrice()+bb.getPrice()+bb.getKind()+bb.getBookstore()+bb.getCount());
		String sql= "insert into book values(bseq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,bb.getTitle());
			ps.setString(2,bb.getAuthor());
			ps.setString(3,bb.getPublisher());
			ps.setInt(4,bb.getPrice());
			ps.setString(5,bb.getDay());
			ps.setString(6,bb.getKind());
			ps.setString(7,bb.getBookstore());
			ps.setInt(8,bb.getCount());
			cnt = ps.executeUpdate();
			System.out.println("cnt:"+cnt);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if (conn != null){
					conn.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}
	public int upadatebook(BookBean bb) {
		int cnt=-1;
		System.out.print(bb.getTitle()+bb.getAuthor()+bb.getPublisher()+bb.getPrice()+bb.getPrice()+bb.getKind()+bb.getBookstore()+bb.getCount());
		String sql= "update book set title=?,author=?,publisher=?,price=?,day=?,kind=?,bookstore=?,count=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,bb.getTitle());
			ps.setString(2,bb.getAuthor());
			ps.setString(3,bb.getPublisher());
			ps.setInt(4,bb.getPrice());
			ps.setString(5,bb.getDay());
			ps.setString(6,bb.getKind());
			ps.setString(7,bb.getBookstore());
			ps.setInt(8,bb.getCount());
			ps.setInt(9,bb.getNo());
			cnt = ps.executeUpdate();
			System.out.println("cnt:"+cnt);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if (conn != null){
					conn.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}
	public BookBean getselect(int no) {
		BookBean bb= new BookBean(); 
		String sql="select * from book where no=?";
		ResultSet rs = null;
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs= ps.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				String day = String.valueOf(rs.getDate("day"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int price = rs.getInt("price");
				int count = rs.getInt("count");
				bb.setAuthor(author);
				bb.setBookstore(bookstore);
				bb.setCount(count);
				bb.setDay(day);
				bb.setKind(kind);
				bb.setNo(no);
				bb.setPrice(price);
				bb.setPublisher(publisher);
				bb.setTitle(title);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if (conn != null){
					conn.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return bb;
	}
	public int deletetebook(int no) {
		int cnt=-1;
		String sql= "delete from book where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,no);
			cnt = ps.executeUpdate();
			System.out.println("cnt:"+cnt);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if (conn != null){
					conn.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}
}
