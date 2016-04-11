package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.DB_operate;
import JavaBean.ProjectBean;
import JavaBean.sqlDeal;

public class QueryServlet extends HttpServlet {
	// 进行项目查询的Servlet

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); // 汉字处理

		// 从表单中获得如下数据
		String project_name = request.getParameter("project_name"); // 项目名称
		String project_bidder = request.getParameter("project_bidder"); // 项目中标者
		String bid_money_min = request.getParameter("bid_money_min"); // 项目中标金额下限
		String bid_money = request.getParameter("bid_money"); // 项目中标金额
		String bid_money_max = request.getParameter("bid_money_max"); // 项目中标金额上限
		String bid_time_min = request.getParameter("bid_time_min"); // 项目中标时间下限
		String bid_time = request.getParameter("bid_time"); // 项目中标时间
		String bid_time_max = request.getParameter("bid_time_max"); // 项目中标时间上限

		// 下面通过处理函数得到sql（数据查询语句）
		sqlDeal SqlDeal = new sqlDeal();   
		String sql = SqlDeal.sqldeal(project_name, project_bidder,
				bid_money_min, bid_money, bid_money_max, bid_time_min,
				bid_time, bid_time_max);
		
		/*String sql = "select * from bid_form";*/ 

		DB_operate db_operate = new DB_operate(); // 实例化一个数据库操作对象

		// 根据sql语句对数据库进行查询
		ArrayList<ProjectBean> projectlist = db_operate.findProjects(sql);

		String forward;

		HttpSession session = request.getSession(true); // 使用session之前的初始化

		session.setAttribute("projectlist", projectlist); // 将projectlist传到pro_query.jsp
		forward = "pro_query.jsp"; // 即将跳转到的网页

		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response); // 跳转到项目展示界面

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

}
