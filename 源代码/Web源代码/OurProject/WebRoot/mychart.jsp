<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="JavaBean.ProjectBean" %>
<%
    String username = (String) session.getAttribute("username");
	if (username==null) {
		request.setAttribute("Error", "Session has ended. Please login.");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		return;
	}
 %>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>图表统计</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
<body>

	<%
	String[] str1 = (String[])session.getAttribute("bid_time");
	String[] str2 = (String[])session.getAttribute("bid_money");
	String bid_time = "[";
	String bid_money = "[";
	if(str1.length != 0){
	for(int i=0;i<str1.length-1;i++){
		bid_time = bid_time+"\""+str1[i]+"\""+",";
		bid_money = bid_money+"\""+str2[i]+"\""+",";
	}
	bid_time = bid_time+"\""+str1[str1.length-1]+"\""+"]";
	bid_money = bid_money+str2[str1.length-1]+"]";
	}else{
		bid_time = "";
		bid_money = "";
	}
	%>

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
            <li><a href="dataAcquisition.jsp"><i class="fa fa-database fa-fw"></i>数据采集</a></li>
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
                <li><a href="dataAcquisition.jsp">数据采集</a></li>
                <li><a href="projectQuery.jsp">项目查询</a></li>
                <li><a href="statisticalAnalysis.jsp">统计分析</a></li>
                <li><a href="systemManagement.jsp">系统管理</a></li>
              </ul>  
            </nav> 
          </div>
        </div>
        <div class="templatemo-content-container">
          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <h2 class="templatemo-inline-block">chart</h2><hr>
              <p>图表辅助按钮里，可以将图表在折线图和柱状图之间切换，可以做辅助线，清除辅助线，还可以将图表保存到本地。</p>
              <br />
              <input type="hidden" id="bid_time" value='<%=bid_time %>' />
			  <input type="hidden" id="bid_money" value='<%=bid_money %>' />
			  <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    		  <div id="main" style="height:400px"></div>            
            </div>
          </div>
          <footer class="text-right" style="text-align: center;">
            <p>Copyright &copy; 2084 Company Name </p>
          </footer>         
        </div>
      </div>
    </div>
    
    <!-- ECharts单文件引入 -->
    <script src="build/dist/echarts.js"></script>
    <script type="text/javascript">
    	var bid_money = eval("("+document.getElementById("bid_money").value+")");
    	var bid_time = eval("("+document.getElementById("bid_time").value+")");
    	
        // 路径配置
        require.config({
            paths: {
                echarts: 'build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar',
                'echarts/chart/line' // 使用柱状图就加载line模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
                    title : {
        				text: '中标情况',
        				subtext: '金额趋势'
    				},
    				tooltip : {
        				trigger: 'axis'
    				},
    				legend: {
        				data:['金额']
    				},
    				toolbox: {
        				show : true,
        				feature : {
            				mark : {show: true},
            				dataView : {show: true, readOnly: false},
            				magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
            				restore : {show: true},
            				saveAsImage : {show: true}
        				}
    				},
    				calculable : true,
    				xAxis : [
        				{
            				type : 'category',
            				boundaryGap : false,
            				data : bid_time
        				}
    				],
    				yAxis : [
        				{
            				type : 'value'
        				}
    				],
    				series : [
        				{
            				name:'金额',
            				type:'line',
            				smooth:true,
            				itemStyle: {normal: {areaStyle: {type: 'default'}}},
            				data : bid_money
        				}
    				]
                };
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
    <!-- JS -->
    <script src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>
