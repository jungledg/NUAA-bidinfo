package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.DB_operate;
import JavaBean.ProjectBean;

public class SpiderShowServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); // 汉字处理
		resp.setContentType("text/html;charset=utf-8");
		
		// 定义sql，查找bid_info中id最大的数据（且仅限制查找一条）
		String sql = "select * from bid_info order by id desc limit 1";

		DB_operate db_operate = new DB_operate(); // 实例化一个数据库操作对象
		// 调用数据库查询语句
		ArrayList<ProjectBean> projectBeanslist = db_operate.findProjects(sql);

		// 实际上projectBeanslist只有一个元素，处理第一个元素就可以了
		ProjectBean projectBean = projectBeanslist.get(0);

		// 得到项目projectBean中的基本信息
		String project_name = projectBean.getProject_name();
		String project_bidder = projectBean.getProject_bidder();
		BigDecimal bid_money = projectBean.getBid_money();
		String bid_time = projectBean.getBid_time();

		// 处理项目的基本信息，作为输出
		String result = "项目名：" + project_name + "   中标单位：" + project_bidder
				+ "   中标金额：" + bid_money + "   中标时间：" + bid_time; 
		
		result="爬取结束！";
		PrintWriter out = resp.getWriter();  
		out.println(result);   //将结果输出到前台界面
		out.flush();
		out.close();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
}
