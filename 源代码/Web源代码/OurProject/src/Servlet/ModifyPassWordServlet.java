package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.DB_operate;

public class ModifyPassWordServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); // 汉字处理

		String password_one = request.getParameter("password_one"); // 得到修改的密码

		// 首先判断session中是否存在用户名，如果存在就修改用户名，否则不能修改
		HttpSession session = request.getSession(true); // 如果session存在就返回session，否则新建一个session
		String username = (String) session.getAttribute("username");
		if (username != null) { // 如果username不等于空就表示用户在登录状态
			// 调用函数对数据库中的密码进行修改

			String sql = "update user_form set PassWord='" + password_one
					+ "' where UserName='" + username + "'";
			DB_operate db_operate = new DB_operate();
			db_operate.modify_password(sql); // 调用修改密码的函数
		}
		String forward="index.jsp"; 
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward); 
		dispatcher.forward(request, response); 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
