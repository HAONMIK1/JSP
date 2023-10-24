package my.prod;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;



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
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds =(DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	public int insertProd(MultipartRequest pb) throws Exception {
		Connection conn = getConnection();
	
		int cnt = -1;
		String sql = "insert into product values(catprod.nextval, ?, ?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pb.getParameter("pname"));
			ps.setString(2, pb.getParameter("pcategory_fk"));
			ps.setString(3, pb.getParameter("pcompany"));
			ps.setString(4, pb.getFilesystemName("pimage"));
			ps.setInt(5, Integer.parseInt(pb.getParameter("pqty")));
			ps.setInt(6, Integer.parseInt(pb.getParameter("price")));
			ps.setString(7, pb.getParameter("pspec"));
			ps.setString(8, pb.getParameter("pcontents"));
			ps.setInt(9,  Integer.parseInt(pb.getParameter("point")));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			String inputdate = sdf.format(today);
			ps.setString(10, inputdate);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return cnt;
	} // insertMember
	public ArrayList<ProdDTO> selectProd() throws Exception  {
		Connection conn = getConnection();
		ArrayList<ProdDTO> lists = new ArrayList<ProdDTO>();
		String sql = "select * from product order by pnum";
		try {
			ps= conn.prepareStatement(sql);
			rs= ps.executeQuery();
			lists = makeArraylist(rs);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return lists;
	}
	public ArrayList<ProdDTO> makeArraylist(ResultSet rs) throws Exception{
		ArrayList<ProdDTO> lists = new ArrayList<ProdDTO>();
		while(rs.next()) {
			ProdDTO pb =new ProdDTO();
			pb.setPnum(rs.getInt("pnum"));
			pb.setPname(rs.getString("pname"));
			pb.setPcategory_fk(rs.getString("pcategory_fk"));
			pb.setPcompany(rs.getString("pcompany"));
			pb.setPimage(rs.getString("pimage"));
			pb.setPqty(rs.getInt("pqty"));
			pb.setPrice(rs.getInt("price"));
			pb.setPsepc(rs.getString("pspec"));
			pb.setPcontents(rs.getString("pcontents"));
			pb.setPoint(rs.getInt("point"));
			pb.setPinputdate(rs.getString("pinputdate"));
			
			lists.add(pb);
		}
		return lists;
	}
	public int deleteProd(int pnum) throws Exception {
		Connection conn = getConnection();
		int cnt =-1;
		String sql = "delete from product where pnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
			cnt = ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cnt;
	}

	public ArrayList<ProdDTO> selectProdNum(int pnum) throws Exception  {
		Connection conn = getConnection();
		ArrayList<ProdDTO> lists = new ArrayList<ProdDTO>();
		String sql = "select * from product where pnum=?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, pnum);
			rs= ps.executeQuery();
			lists = makeArraylist(rs);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return lists;
	}
	public int updateProd(MultipartRequest mr,String img)throws Exception  {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "update product set  pname= ?,pcompany= ?,pimage= ?,pqty = ?,price = ?,pspec = ?,pcontents = ?,point =?,pinputdate = ? where pnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcompany"));
			ps.setString(3, img);
			ps.setInt(4, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
			ps.setString(6, mr.getParameter("pspec"));
			ps.setString(7, mr.getParameter("pcontents"));
			ps.setInt(8,  Integer.parseInt(mr.getParameter("point")));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//MM대문자 월 mm소문자 분 !!!!!!!!
			Date today = new Date();
			String inputdate = sdf.format(today);
			ps.setString(9, inputdate);
			ps.setString(10, mr.getParameter("pnum"));
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return cnt;
	}
	public ArrayList<ProdDTO> selectspec(String pspec)throws Exception{
		Connection conn = getConnection();
		ArrayList<ProdDTO> lists = new ArrayList<ProdDTO>();
		String sql = "select * from product where pspec = ?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, pspec);
			rs= ps.executeQuery();
			lists = makeArraylist(rs);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return lists;
	}
		public ArrayList<ProdDTO> selectCategory(String pcategory_fk)throws Exception{
		Connection conn = getConnection();
		ArrayList<ProdDTO> lists = new ArrayList<ProdDTO>();
		String sql = "select * from product where pcategory_fk = ?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, pcategory_fk);
			rs= ps.executeQuery();
			lists = makeArraylist(rs);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return lists;
	}
		public int UpdateNumber(int pnum,int ovaule)throws Exception {
			int cnt =0;
			Connection conn = getConnection();
			String sql="update product set pqty= ? where pnum = ? ";
			ps =conn.prepareStatement(sql);
			ps.setInt(1, ovaule);
			ps.setInt(2, pnum);
			ps.executeUpdate();
			return cnt ;
		}
}

