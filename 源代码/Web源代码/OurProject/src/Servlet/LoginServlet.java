package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.DB_operate;
import JavaBean.UserBean;

public class LoginServlet extends HttpServlet {
	// 登录处理的Servlet 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		request.setCharacterEncoding("utf-8"); // 汉字处理

		String username = request.getParameter("username"); // 得到username
		String userpass = request.getParameter("userpass"); // 得到密码

		// 用username作为查询字在user_form中进行查询
		DB_operate db_operate = new DB_operate(); // 实例化一个数据库操作类

		//ArrayList<UserBean> user_list = new ArrayList<UserBean>();
		//user_list = db_operate.findAll();

		UserBean userdemo = db_operate.findOne(username, userpass);
		 

		// UserBean userdemo=db_operate.findOne(username); //查询结果

		String forward;

		if (userdemo!= null) {
			HttpSession session = request.getSession(true);
			// request.getSession(false);

			int ref=1;
			session.setAttribute("username", username);
			session.setAttribute("ref", ref);
			session.setAttribute("usertype", userdemo.getUsertype());
			session.setAttribute("user", userdemo);
			forward = "index.jsp";
		} else {
			forward = "failure.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);

		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}

}
