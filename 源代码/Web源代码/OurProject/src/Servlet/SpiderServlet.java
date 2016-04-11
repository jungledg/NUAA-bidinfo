package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ChooseSpider;

import net.sf.json.JSONObject;

import HttpRequest.HttpRequest;
import JavaBean.DB_operate; 

public class SpiderServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 汉字处理
		String website = request.getParameter("tra"); // 得到username
		
		
        //根据网址得到爬虫名称
		ChooseSpider choosespider=new ChooseSpider();
		String spider=choosespider.chooseSpider(website);  //spider为爬虫名称
		

		//post请求的参数
		String url = "http://host.zhwen.me:6800/schedule.json";
		String param = "project=SEproject&spider="+spider;

		// 实例化一个发送post请求的对象
		HttpRequest sendpost = new HttpRequest();

		// 发送请求
		sendpost.sendPost(url, param);
 
		
		HttpSession session = request.getSession(true);
		session.setAttribute("website", website);  //设置在前台显示的参数 
		
		String forward="dataAcquisition.jsp"; 
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward); 
		dispatcher.forward(request, resp); 
		
		
		   
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

}
