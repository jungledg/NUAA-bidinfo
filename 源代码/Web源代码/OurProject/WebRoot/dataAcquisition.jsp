<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>数据采集</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo"> 
    
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.progressbar.min.js"></script>
    
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
            <li><a href="webAddressConfig.jsp"><i class="fa fa-bar-chart fa-fw"></i>网址配置</a></li>
            <li><a href="#" class="active"><i class="fa fa-database fa-fw"></i>数据采集</a></li>
            <li><a href="projectQuery.jsp"><i class="fa fa-map-marker fa-fw"></i>项目查询</a></li>
            <li><a href="statisticalAnalysis.jsp"><i class="fa fa-users fa-fw"></i>统计分析</a></li>
            <li><a href="systemManagement.jsp"><i class="fa fa-sliders fa-fw"></i>系统管理</a></li>
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
                <li><a href="webAddressConfig.jsp">网址配置</a></li>
                <li><a href="#" class="active">数据采集</a></li>
                <li><a href="projectQuery.jsp">项目查询</a></li>
                <li><a href="statisticalAnalysis.jsp">统计分析</a></li>
                <li><a href="systemManagement.jsp">系统管理</a></li>
              </ul>  
            </nav> 
          </div>
        </div>
        <div class="templatemo-content-container">         
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10"><center>数据采集</center></h2>
            <div class="panel panel-default no-border" style="height: 760px;">
              <div class="panel-heading border-radius-10">
                <h2>爬虫信息</h2>
              </div>
              <div class="panel-body">
                <div class="templatemo-flex-row flex-content-row margin-bottom-30">  
					<!-- <p style="margin: 100px;"> --> 
					<center><h2>正在爬取
					<%
					String website = (String) session.getAttribute("website");
					out.print(website);
					
					 %>的内容:</h2></center><br />
					  
					 
					 
					<!-- <span class="progressBar" id="spaceused3">12%</span> -->  
					
					<form name="registerform" action="web_spider" method="post"> 
						<input type="hidden" name="username" ><br /><br /><br /><br />
						<label for=username id="userlabel" name="userlabel"></label>
					</form>
					
					
					<!-- </p>  --> 
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
  <script type="text/javascript">
			$(document).ready(function() {
				$("#spaceused3").progressBar({ barImage: 'images/progressbg_red.gif', showText: true} );
			});
  </script>
  <script type="text/javascript">

	var xMLHttpRequest=false;
    function createXMLHttpRequest(){
    	if(window.XMLHttpRequest){
    		xMLHttpRequest=new XMLHttpRequest(); 
    	}else if(window.ActiveXObject){
    		try{
    			xMLHttpRequest=new ActiveXObject("Msxm12.XMLHTTP");
    		
    		}catch(e){
    			try{
    				xMLHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
    			}catch(e){} 
    		} 
    	}
    }
    
    function processResponse(){
     
    
    
    	if(xMLHttpRequest.readyState==4){
    		if(xMLHttpRequest.status==200){
    			var res=xMLHttpRequest.responseText;
    			document.getElementById("userlabel").innerText=res;
    			//window.alert(document.getElementById("userlabel").innerText);
    			$("#userlabel").text(res); 
    			
    		}else{
    			window.alert("您请求的页面有异常！");
    		}
    	
    	} 
    }
    
    function use(){ 
    
    	createXMLHttpRequest();
    	xMLHttpRequest.open("GET", "show_spider?username="+document.registerform.username.value, true);
    	xMLHttpRequest.onreadystatechange=processResponse;
    	xMLHttpRequest.send(null); 
    }
    
    
    
    /* var iID=setTimeout(function(){
        createXMLHttpRequest();
    	xMLHttpRequest.open("GET", "web_spider?username="+document.registerform.username.value, true);
    	xMLHttpRequest.onreadystatechange=processResponse;
    	xMLHttpRequest.send(null);
    },1000); */
    
    setInterval(function(){
        createXMLHttpRequest();
    	xMLHttpRequest.open("GET", "show_spider?username="+document.registerform.username.value, true);
    	xMLHttpRequest.onreadystatechange=processResponse;
    	xMLHttpRequest.send(null);
    },500);





  </script>
</html>