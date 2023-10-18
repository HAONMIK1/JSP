package my.prod;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ProdDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs =null;
//싱글톤 객체 생성
	public static ProdDAO instance = new ProdDAO();
	public static ProdDAO getInstance() {
		return instance;
	}
	
	private ProdDAO() {
	// TODO Auto-generated constructor stub
}
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/enc");
		DataSource ds =(DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	public int insertProd(ProdDTO pb) throws Exception {
		Connection conn = getConnection();
	
		int cnt = -1;
		String sql = "insert into product values(catprod.nextval, ?, ?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pb.getPname());
			ps.setString(2, pb.getPcategory_fk());
			ps.setString(3, pb.getPcompany());
			ps.setString(4, pb.getPimage());
			ps.setInt(5, pb.getPqty());
			ps.setInt(6, pb.getPrice());
			ps.setString(7, pb.getPsepc());
			ps.setString(8, pb.getPcontents());
			ps.setInt(9, pb.getPoint());
			ps.setString(10, pb.getPinputdate());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return cnt;
	} // insertMember
	public ArrayList<ProdDTO> selectProd() throws Exception  {
		Connection conn = getConnection();
		ArrayList<ProdDTO> lists = new ArrayList<ProdDTO>();
		String sql = "select * from product";
		try {
			ps= conn.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				ProdDTO pb =new ProdDTO();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcategory_fk(rs.getString("pcategory_fk"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pname"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPsepc(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPoint(rs.getInt("point"));
				pb.setPinputdate(rs.getString("pinputdate"));
				
				lists.add(pb);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return lists;
	}
}
