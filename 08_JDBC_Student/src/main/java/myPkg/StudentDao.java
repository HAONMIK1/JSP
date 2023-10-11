package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";

	public StudentDao() {
		try {
			// 로드
			Class.forName(driver);
			// 접속
			conn = DriverManager.getConnection(url,dbId,dbPw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//StudentDao

	public ArrayList<StudentBean> getAllStudents(){
		PreparedStatement ps = null;
		ResultSet rs= null;
		ArrayList<StudentBean> lists = new ArrayList<StudentBean>();
		String sql = "select * from Student order by num asc";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				int num =Integer.parseInt(rs.getString("num"));
				String id = rs.getString("id");
				String passwd= rs.getString("passwd");
				String name=rs.getString("name");
				int year =Integer.parseInt(rs.getString("year"));
				int month =Integer.parseInt(rs.getString("month"));
				int day =Integer.parseInt(rs.getString("day"));
				//String day = String.valueOf(rs.getDate("day"));
				String hobby=rs.getString("hobby");
				int c =Integer.parseInt(rs.getString("c"));
				int java =Integer.parseInt(rs.getString("java"));
				int jsp =Integer.parseInt(rs.getString("jsp"));
				int sum =Integer.parseInt(rs.getString("sum"));
				
				StudentBean sb = new StudentBean();
				sb.setNum(num);
				sb.setId(id);
				sb.setPasswd(passwd);
				sb.setName(name);
				sb.setYear(year);
				sb.setMonth(month);
				sb.setDay(day);
				sb.setHobby(hobby);
				sb.setC(c);
				sb.setJava(java);
				sb.setJsp(jsp);
				sb.setSum(sum);
				//StudentBean sb2 = new StudentBean(num,id,passwd,name,year,month,day,hobby,c,java,jsp,sum);
				
				lists.add(sb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(rs!=null) {
					rs.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("lists.size():" + lists.size());
		return lists;
	}// getAllStudent
	

	public int insertData(StudentBean sb) {
		int cnt = -1;
		String sql="insert into student values(stu_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getId());
			ps.setString(2, sb.getPasswd());
			ps.setString(3, sb.getName());
			ps.setInt(4, sb.getYear());
			ps.setInt(5, sb.getMonth());
			ps.setInt(6, sb.getDay());
			ps.setString(7, sb.getHobby());
			ps.setInt(8, sb.getC());
			ps.setInt(9, sb.getJava());
			ps.setInt(10, sb.getJsp());
			ps.setInt(11, sb.getSum());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	} //insertData
	
	public StudentBean getStudentByNum(int num) {
		StudentBean sb = null;
		String sql = "select * from student where num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				sb = new StudentBean(num , 
									rs.getString("id"), 
									rs.getString("passwd"),
									rs.getString("name"), 
									rs.getInt("year"), 
									rs.getInt("month"), 
									rs.getInt("day"), 
									rs.getString("hobby"), 
									rs.getInt("c"), 
									rs.getInt("java"), 
									rs.getInt("jsp"), 
									rs.getInt("sum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
				if(conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sb;
	} // getStudentByNum
	
	public int updateData(StudentBean sb) {
		int cnt = -1;
		PreparedStatement ps = null;
		
		String sql = "update student set passwd=?,name=?,year=?,month=?,day=?,hobby=?,c=?,java=?,jsp=?,sum=? where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getPasswd());
			ps.setString(2, sb.getName());
			ps.setInt(3, sb.getYear());
			ps.setInt(4, sb.getMonth());
			ps.setInt(5, sb.getDay());
			ps.setString(6, sb.getHobby());
			ps.setInt(7, sb.getC());
			ps.setInt(8, sb.getJava());
			ps.setInt(9, sb.getJsp());
			ps.setInt(10, sb.getSum());
			ps.setInt(11, sb.getNum());
			
			cnt = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("updateData cnt : " + cnt);
		return cnt;
	}//updateData
	
	public int deleteData(int num) {
		
		int cnt = 0;
		
		try {
			String sql = "delete from student where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}//deleteData
	
	public int deleteCheckData(String[] rowcheck) {
		int cnt =-1;
		String sql = "delete student where num = ? ";
		for(int i=0;i<rowcheck.length-1;i++) {
			sql +=" or num=?";
			// delete student where num = ? or num=? or num=?
		}
		
		try {
			ps = conn.prepareStatement(sql);
			for(int i=1;i<=rowcheck.length;i++) {
				ps.setString(i, rowcheck[i-1]);
			}
			cnt = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}//deleteCheckData
	public boolean searchID(String id) {
		boolean isCheck=false;
		String sql = "select * from student where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				isCheck=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
				if(conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isCheck;
	}
}



