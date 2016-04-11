package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBBean {

	private Connection con;
	private Statement stmt;
	private ResultSet rs;

	// 构造函数
	public DBBean() {
	}

	// 取得链接
	public Connection getConnection() throws Exception {
		String url = "jdbc:mysql://host.zhwen.me:3306/nuaa_se?characterEncoding=utf8";
		String dbuser = "nuaa";
		String dbpass = "ccst";
		if (con == null) {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, dbuser, dbpass);
		}
		return con;
	}

	// 查询函数
	public ResultSet executeQuery(String sql) throws Exception {
		if (con == null) {
			throw new Exception("没有链接对象可用");
		}
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		return rs;
	}

	// 执行更新语句
	public int executeUpdate(String sql) throws Exception {
		if (con == null) {
			throw new Exception("没有连接可用");
		}
		stmt = con.createStatement();
		return stmt.executeUpdate(sql);
	}

	// 关闭数据库
	public void close() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
