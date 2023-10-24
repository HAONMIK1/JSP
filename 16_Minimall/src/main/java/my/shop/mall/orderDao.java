package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.prod.ProdDTO;

public class orderDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs =null;
	public orderDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:"+conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//orderDao()
	public int  insertOrder(int no ,Vector<ProdDTO> cv) {
		int cnt =0;
		int sum =0;
		try {
			conn.setAutoCommit(false);
			String sql = "insert into orders values(orderseq.nextval,?,?,?,?)";
			for(int i=0 ; i<cv.size();i++) {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,no);
			ps.setInt(2, cv.get(i).getPnum());
			ps.setInt(3, cv.get(i).getPqty());
			ps.setInt(4, cv.get(i).getPrice()*cv.get(i).getPqty());
		cnt+=	ps.executeUpdate();
			}//for문
			if(cnt==cv.size()) {
				conn.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cnt;
	}//insertOrder
public Vector<orderBean> getorderList(String id) {
	 Vector<orderBean> lists = new Vector<orderBean>();
     String sql = "select m.name mname, m.id, p.pname, o.qty, o.amount"
           + "from (members m inner join orders o on m.no = o.memno) inner join product p on o.pnum = p.pnum"
           + "where id=?";
     try {
        ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        rs = ps.executeQuery();
        while(rs.next()) {
           orderBean ob = new orderBean();
           ob.setMname(rs.getString("mname"));
           ob.setMid(rs.getString("id"));
           ob.setPname(rs.getString("pname"));
           ob.setQty(rs.getInt("qty"));
           ob.setAmount(rs.getInt("amout"));
           lists.add(ob);
        }
     }catch(Exception e) {
        e.printStackTrace();
     }
     return lists;
  } // getOrderList//getorderList
}//public class orderDao
