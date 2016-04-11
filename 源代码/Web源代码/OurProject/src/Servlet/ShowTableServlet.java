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
import JavaBean.TableProBean;

public class ShowTableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 汉字处理
		
		// 从表单中获得如下数据
		String start_time = req.getParameter("start_time"); // 时间下限
		String end_time = req.getParameter("end_time"); // 时间上限
		
		String sql = "select * from bid_info where Bid_Time>="+"'"+start_time+"' "+"and Bid_time<='"+end_time+"' order by Project_Bidder asc";
		String sql1 = "select distinct(Project_Bidder) from bid_info";
		
		// 用username作为查询字在user_form中进行查询
		DB_operate db_operate = new DB_operate(); // 实例化一个数据库操作类
		
		ArrayList<ProjectBean> projectlist = db_operate.findProjects(sql);
		ArrayList<String> project_bidder = db_operate.findProjectBidder(sql1);
		
		ArrayList<TableProBean> tplist = new ArrayList<TableProBean>();
		String[] sum_money = new String[project_bidder.size()];
		for(int i=0;i<project_bidder.size();i++)
			sum_money[i]="0";
		
		for(int i=0;i<projectlist.size();i++){
			for(int j=0;j<project_bidder.size();j++){
				if(projectlist.get(i).getProject_bidder().equals(project_bidder.get(j)))
					sum_money[j] = Integer.toString(Integer.parseInt(sum_money[j]) + projectlist.get(i).getBid_money().intValue());
			}
		}
		for(int i=0;i<project_bidder.size();i++){
			TableProBean tpb = new TableProBean(project_bidder.get(i), sum_money[i]);
			tplist.add(tpb);
		}
		String forward;

		HttpSession session = req.getSession(true);

		session.setAttribute("tplist", tplist);
		forward = "mytable.jsp";

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
