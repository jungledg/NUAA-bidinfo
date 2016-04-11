package JavaBean;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DB_operate { 
	
	//向用户表中增加新用户
	public void add_user(String sql){ 
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		DBBean db = new DBBean(); 
		try { 
			con = db.getConnection();   //连接数据库
			db.executeUpdate(sql);    //执行密码修改操作
			 
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
			} catch (Exception e1) {
			}

			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		} 
	}
	
	//根据sql来修改用户密码
	public void modify_password(String sql){ 
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		DBBean db = new DBBean(); 
		try { 
			con = db.getConnection();   //连接数据库
			db.executeUpdate(sql);    //执行密码修改操作
			 
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
			} catch (Exception e1) {
			}

			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		} 
	}
	
	//根据sql来查询项目集（一个或者多个）
	public ArrayList<ProjectBean> findProjects(String sql){
		
		ArrayList<ProjectBean> userlist = new ArrayList<ProjectBean>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		DBBean db = new DBBean(); 
		try {

			con = db.getConnection();
			rs = db.executeQuery(sql);
			while (rs.next()) {
				
				String project_name=rs.getString("Project_Name");
				String project_bidder=rs.getString("Project_Bidder");
				BigDecimal bid_money=rs.getBigDecimal("Bid_Money");
				String bid_time=rs.getString("Bid_Time"); 
				
				ProjectBean projectlist=new ProjectBean(project_name, project_bidder, bid_money, bid_time);
				 
				userlist.add(projectlist);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
			} catch (Exception e1) {
			}

			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		}
		return userlist; 
	}
	
	
	// 根据sql来查询中标单位（一个或者多个）
	public ArrayList<String> findProjectBidder(String sql) {

		ArrayList<String> project = new ArrayList<String>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		DBBean db = new DBBean();
		try {

			con = db.getConnection();
			rs = db.executeQuery(sql); 
			while (rs.next()) {
				project.add(rs.getString("Project_Bidder"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
			} catch (Exception e1) {
			}

			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		}
		return project;
	}
	
	
	// 得到所有的用户
	public ArrayList<UserBean> findAll() {
		ArrayList<UserBean> userlist = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		DBBean db = new DBBean();
		String sql = "select * from user_form";
		try {

			con = db.getConnection();
			rs = db.executeQuery(sql);
			while (rs.next()) {
 
				String username = rs.getString("UserName");
				String userpass = rs.getString("PassWord");
				String usertype = rs.getString("UserType");

				UserBean userdemo = new UserBean(username, userpass, usertype);

				userlist.add(userdemo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
			} catch (Exception e1) {
			}

			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		}
		return userlist;
	}

	// 查询某个用户(根据账户作为索引来查询用户)
	public UserBean findOne(String UserName, String PassWord) {
		//该函数的作用就是返回用户名为UserName，且密码为PassWord的用户
		
		UserBean userdemo = null; // 作为函数的返回结果
		ArrayList<UserBean> user_list = new ArrayList<UserBean>();
		user_list = findAll();  //首先得到所有的用户集

		//遍历所有用户集，寻找符合条件的用户
		for (int i = 0; i < user_list.size(); i++) {
			String ref = user_list.get(i).getUsername();
			String reb = user_list.get(i).getUserpass();
			if (UserName.equals(ref)) { // 账户名存在
				if (PassWord.equals(reb)) { // 对应的密码正确
					userdemo = user_list.get(i);
					break;  //找到该用户就结束循环
				}
			}
		}
		return userdemo;
		//如果用户不存在就返回空
	}
	
	
	/*// 查询某个用户(根据账户作为索引来查询用户)
	public UserBean findOne(String UserName) {

		UserBean userdemo = new UserBean(); // 作为函数的返回结果
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		DBBean db = new DBBean();

		StringBuffer sql = new StringBuffer();
		sql.append("select * from user_form where UserName='");
		sql.append(UserName);
		sql.append("'");

		try {

			con = db.getConnection();
			rs = db.executeQuery(sql.toString());

			while (rs.next()) {

				String username = rs.getString("UserName");
				String userpass = rs.getString("PassWord");
				String usertype = rs.getString("UserType");

				userdemo.setUsername(username);
				userdemo.setUserpass(userpass);
				userdemo.setUsertype(usertype);

				break;

			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
			} catch (Exception e1) {
			}

			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		}
		return userdemo;
	}*/
	// 删除用户(根据账户作为索引来删除用户)
	public int delete(String UserName) throws Exception {

		int flag = 0;
		Connection con = null;
		DBBean db = new DBBean();
		StringBuffer sql = new StringBuffer();
		sql.append("delete from user_form where UserName='");
		sql.append(UserName);
		sql.append("'");

		try {
			// 首先得取得数据库的连接
			con = db.getConnection();
			flag = db.executeUpdate(sql.toString());
			return flag;
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			// 最后别忘了关闭数据库
			db.close();
		}
		return flag;
	}
}
