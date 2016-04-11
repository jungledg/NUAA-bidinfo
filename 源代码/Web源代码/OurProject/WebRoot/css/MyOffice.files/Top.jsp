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
<HEAD id=Head1>
<TITLE>无标题页</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>
* {
	FONT-SIZE: 12px;
	COLOR: white
}

#logo {
	COLOR: white
}

#logo A {
	COLOR: white
}

FORM {
	MARGIN: 0px
}
</STYLE>
<SCRIPT src="Top.files/Clock.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY
	style="BACKGROUND-IMAGE: url(../images/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x">
	<form id="form1">
		<DIV id=logo
			style="BACKGROUND-IMAGE: url(../images/logo.png); BACKGROUND-REPEAT: no-repeat">
			<DIV
				style="PADDING-RIGHT: 50px; BACKGROUND-POSITION: right 50%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(../images/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px;WIDTH: 30% TEXT-ALIGN: right">
				<A href="http://localhost:1479/Web/sys/Top.aspx#"></A> 
					 <A
					id=HyperLink3
					href="javascript:window.opener=null;%20window.close();">
					退出系统
					
					</A>
			</DIV>
			<DIV style="DISPLAY: block; HEIGHT: 54px"></DIV>
			<DIV
				style="BACKGROUND-IMAGE: url(../images/bg_nav.gif); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
				<TABLE cellSpacing=0 cellPadding=0 width="100%">
					<TBODY>
						<TR>
							<TD>
								<DIV>
									<IMG src="Top.files/nav_pre.gif" align=absMiddle>
									<%
										 
										String usertype=(String)session.getAttribute("usertype"); 
										if(usertype!=null){
											if(usertype.equals("1")){
									    	out.print("管理员：");
										    }else{
										   	 	out.print("普通用户：");
										    } 
										}  
									%>
									${sessionScope.username} 欢迎登录!
								</DIV>
							</TD>
							<TD align=right width="70%"><SPAN
								style="PADDING-RIGHT: 50px"><A
									href="javascript:history.go(-1);"><IMG
										src="Top.files/nav_back.gif" align=absMiddle border=0>后退</A>
									<A href="javascript:history.go(1);"><IMG
										src="Top.files/nav_forward.gif" align=absMiddle border=0>前进</A>
									<A href="../../../OurProject/exit.jsp" target=_top><IMG
										src="Top.files/nav_changePassword.gif" align=absMiddle
										border=0>
								      	 重新登录 
										</A> <A
									href="../../../OurProject/modify_pw.jsp" 
									target=mainFrame><IMG src="Top.files/nav_resetPassword.gif"
										align=absMiddle border=0>修改密码</A> <A
									href="http://localhost:1479/Web/sys/Top.aspx#" target=mainFrame><IMG
										src="Top.files/nav_help.gif" align=absMiddle border=0>帮助</A>
									<IMG src="Top.files/menu_seprator.gif" align=absMiddle> <SPAN
									id=clock></SPAN> </SPAN></TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
		</DIV>
		<SCRIPT type=text/javascript>
			var clock = new Clock();
			clock.display(document.getElementById("clock")); 
		</SCRIPT>
	</form>
</BODY>
</HTML>
