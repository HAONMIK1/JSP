package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.member.MemberDAO;
import my.member.MemberDTO;

public class CategoryDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs =null;
//싱글톤 객체 생성
	public static CategoryDAO instance = new CategoryDAO();
	public static CategoryDAO getInstance() {
		return instance;
	}
	private CategoryDAO() {
	}
	//여기까지 싱글톤
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}//getConnection()
	public int insertCategory(String code,String name) throws Exception {
		Connection conn = getConnection();
	
		int cnt = -1;
		String sql = "insert into category values(catseq.nextval, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,code );
			ps.setString(2, name);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return cnt;
	} // insertMember
	public ArrayList<CategoryDTO> selectCategory() throws Exception  {
		Connection conn = getConnection();
		ArrayList<CategoryDTO> lists = new ArrayList<CategoryDTO>();
		String sql = "select * from category order by cnum";
		try {
			ps= conn.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				CategoryDTO cb1 =new CategoryDTO();
				cb1.setCnum(rs.getInt("cnum"));
				cb1.setCname(rs.getString("cname"));
				cb1.setCode(rs.getString("code"));
				lists.add(cb1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return lists;
	}
	public int deleteCategory(int cnum) throws Exception {
		Connection conn = getConnection();
		int cnt =-1;
		String sql = "delete from category where cnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			cnt = ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cnt;
	}
}
