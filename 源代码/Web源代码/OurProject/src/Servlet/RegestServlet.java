package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import JavaBean.DB_operate;

public class RegestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); // 汉字处理
		String username = request.getParameter("username"); // 得到username
		String userpass = request.getParameter("userpass"); // 得到密码
		String usertype = request.getParameter("usertype"); // 得到用户类型
		if (usertype.equals("管理员")) {
			usertype = "1"; // 1表示管理员
		} else {
			usertype = "0"; // 0表示普通用户
		}
		String sql = null;
		sql = "insert into user_form(UserName,PassWord,UserType)values(" + "'"
				+ username + "'" + "," + "'" + userpass + "'" + "," + "'"
				+ usertype + "'" + ")"; // 数据库操作语句
		DB_operate db_operate = new DB_operate();
		db_operate.add_user(sql); // 向数据库中增加新用户

		String forward;

		forward = "login.jsp"; // 即将跳转到的网页

		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, resp); // 跳转到项目展示界面
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
}
