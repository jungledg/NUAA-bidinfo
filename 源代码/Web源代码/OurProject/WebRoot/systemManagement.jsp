<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<script language='JavaScript'>
	function isValidate(form) {
	    password_one = form.password_one.value;
		password_two = form.password_two.value;  

		if (!minLength(password_one, 6)) {
			alert("口令长度小于6位！");
			form.userpass.focus();
			return false;
		}
		
		if(password_one!=password_two){
			alert("两次输入密码不一致，请重新输入！"); 
			return false; 
		}else{
			document.getElementById('modform').submit();
			return true;
		} 
	} 
	function minLength(str, length) {
		if (str.length >= length)
			return true;
		else
			return false;
	}

	function maxLength(str, length) {
		if (str.length <= length)
			return true;
		else
			return false;
	}
</script>
<%
  
  
    String username = (String) session.getAttribute("username");
	if (username==null) {
		request.setAttribute("Error", "Session has ended. Please login.");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		return;
	}
 %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>系统管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" /> 
    <link href="css/templatemo-style.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>中标数据采集系统</h1>
          <h4 style="color:#DDDDDD; text-align: right;">——重庆市政府采购网</h4>
        </header>
        <div class="profile-photo-container">
          <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">  
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">           
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>主页</a></li>
            <% 				 
					String usertype=(String)session.getAttribute("usertype"); 
					if(usertype!=null){
						if(usertype.equals("1")){%>
				    	 	 <li><a href="webAddressConfig.jsp"><i class="fa fa-bar-chart fa-fw"></i>网址配置</a></li>
            				 <li><a href="dataAcquisition.jsp"><i class="fa fa-database fa-fw"></i>数据采集</a></li>
					    <%} 
					}  
			%> 
            <li><a href="projectQuery.jsp"><i class="fa fa-map-marker fa-fw"></i>项目查询</a></li>
            <li><a href="statisticalAnalysis.jsp"><i class="fa fa-users fa-fw"></i>统计分析</a></li>
            <li><a href="#" class="active"><i class="fa fa-sliders fa-fw"></i>系统管理</a></li>
            <li><a href="login.jsp"><i class="fa fa-eject fa-fw"></i>重新登录</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <% 				 
					usertype=(String)session.getAttribute("usertype"); 
					if(usertype!=null){
						if(usertype.equals("1")){%>
				    	 	 <li><a href="webAddressConfig.jsp">网址配置</a></li>
                			 <li><a href="dataAcquisition.jsp">数据采集</a></li>
					    <%} 
					}  
				%>
                <li><a href="projectQuery.jsp">项目查询</a></li>
                <li><a href="statisticalAnalysis.jsp">统计分析</a></li>
                <li><a href="#" class="active">系统管理</a></li>
              </ul>  
            </nav> 
          </div>
        </div>
        <div class="templatemo-content-container">         
          <div class="templatemo-content-widget white-bg">
            <div class="panel panel-default no-border"  style="height: 760px;">
              <div class="panel-heading border-radius-10">
                <h2 align="center">密码修改</h2>
              </div>
              <div class="panel-body">
                <div class="templatemo-flex-row flex-content-row margin-bottom-30">  
					<form name="modform" id="modform" action="modify" method="post"  style="margin: 0 auto;">
						密码修改为: <input type="password" class="form-control" name="password_one" style="color:gray; width: 300px;"></input><br />
						重输入密码: <input type="password" class="form-control" name="password_two" style="color:gray; width: 300px;"></input><br /> 
						<input type="reset" class="templatemo-blue-button width-100" value="重置" style="margin-right:2px; width: 148px;"></input> 
						<input type="button" class="templatemo-blue-button width-100" value="确定" onclick="isValidate(modform)" style="margin-left:2px; width: 148px;"></input><br />
					</form> 
                </div>     
              </div>
            </div>            
          </div>
          <footer class="text-right" style="text-align: center;">
            <p>Copyright &copy; 2084 Company Name </p>
          </footer>         
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
  </body>
</html>