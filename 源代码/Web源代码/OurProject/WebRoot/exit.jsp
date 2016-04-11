<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<% 

	response.setHeader("Pragma","No-cache");    
	response.setHeader("Cache-Control","no-cache");    
	response.setDateHeader("Expires", 0);
	
    String username = (String) session.getAttribute("username");
	if (username==null) {
		request.setAttribute("Error", "Session has ended. Please login.");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		return;
	}
 %> 
<HTML>
<HEAD>
<title>用户登录</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="css/images/public.css" type=text/css rel=stylesheet> 
 

<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY>
	 <%-- <% session.removeAttribute("username"); session.invalidate(); %> --%>
     <jsp:forward page="login.jsp"></jsp:forward>
</BODY>
</HTML>
