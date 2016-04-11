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

public class ShowChartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8"); // 汉字处理
		
		// 从表单中获得如下数据
		String project_bidder = req.getParameter("project_bidder"); // 中标单位
		
		String sql = "select * from bid_info where Project_Bidder like "+"'%"+project_bidder+"%'"+"order by Bid_Time asc";
		
		// 用username作为查询字在user_form中进行查询
		DB_operate db_operate = new DB_operate(); // 实例化一个数据库操作类
		
		ArrayList<ProjectBean> projectlist = db_operate.findProjects(sql);
		String[] bid_money = new String[projectlist.size()];
		String[] bid_time = new String[projectlist.size()];
		for(int i=0;i<projectlist.size();i++){
			bid_money[i] = projectlist.get(i).getBid_money().toString();	
			bid_time[i] = projectlist.get(i).getBid_time();
		}
		
		String forward;
		HttpSession session = req.getSession(true);		
		session.setAttribute("bid_money", bid_money);
		session.setAttribute("bid_time", bid_time);
		forward = "mychart.jsp";		
		RequestDispatcher dispatcher = req.getRequestDispatcher(forward);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
}
