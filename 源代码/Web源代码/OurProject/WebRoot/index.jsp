<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
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
    <title>首页</title>
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
            <li><a href="#" class="active"><i class="fa fa-home fa-fw"></i>主页</a></li>
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
                <li><a href="systemManagement.jsp">系统管理</a></li>
              </ul>  
            </nav> 
          </div>
        </div>
        <div class="templatemo-content-container">
          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="square"></div>
              <h2 class="templatemo-inline-block">重庆市政府网中标数据采集系统</h2><hr>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;让数据更加清晰，让信息实现价值。本系统主要针对重庆市的政府网站，从中提取各单位的中标信息，加以统计分析，然后再将数据进行可视化显示，让需要的用户能够更加轻松的浏览和查询相关的信息。</p>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;本系统主要为用户提供以下四大功能：<br>&nbsp;&nbsp;&nbsp;&nbsp;1、网址配置<br>&nbsp;&nbsp;&nbsp;&nbsp;2、数据采集<br>&nbsp;&nbsp;&nbsp;&nbsp;3、混合查询<br>&nbsp;&nbsp;&nbsp;&nbsp;4、统计分析</p>              
            </div>
          </div>
          <div class="templatemo-flex-row flex-content-row">
            <div class="col-1">              
              <div class="templatemo-content-widget orange-bg">
                <i class="fa fa-times"></i>                
                <div class="media">
                  <div class="media-left">
                    <a href="#">
                      <img class="media-object img-circle" src="images/sunset.jpg" alt="Sunset">
                    </a>
                  </div>
                  <div class="media-body">
                    <h2 class="media-heading text-uppercase">重庆——历史文化</h2>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重庆是中国著名的历史文化名城，具有3000多年的悠久历史和光荣的革命传统，以重庆为中心的古巴渝地区是巴渝文化的发祥地，这片土地孕育了重庆悠久的历史。距今2～3万年的旧石器时代末期，已有人类生活在重庆地区。公元前11世纪商周时期，巴人以重庆为首府，建立了巴国。后秦灭巴国，分天下为三十六郡， 巴郡为其一。极盛时期巴国疆域以原重庆市为行政中心，管辖川东、陕南、鄂西、湘西北和黔北等区域。自秦汉以来的历朝历代，这一区域多数时期为一个统一的行政辖区，其行政中心设在原重庆市。</p>  
                  </div>        
                </div>                
              </div>            
              <div class="templatemo-content-widget white-bg">
                <i class="fa fa-times"></i>
                <div class="media">
                  <div class="media-left">
                    <a href="#">
                      <img class="media-object img-circle" src="images/sunset.jpg" alt="Sunset">
                    </a>
                  </div>
                  <div class="media-body">
                    <h2 class="media-heading text-uppercase">重庆——风景名胜</h2>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重庆市旅游资源堪称得天独厚。纵观市城内巴山绵延，渝水纵横，俯瞰历史源远流长，文化积淀深厚，构成了集山、水、林、泉、瀑、峡、洞等为一体的壮丽自然景色和熔巴渝文化、民族文化、移民文化、三峡文化、“陪都”文化、都市文化于一炉的浓郁文化色彩。从夏禹王“三过其门而不入”的涂山旧痕，到国共两党众多名人名事遗址；从大宁河千古悬棺真貌，到“上帝折鞭之处”的合川钓鱼城古迹；从驰名古今的长江三峡，到誉满天下折大足石刻，组成具有重庆特色的“山城都市风光”、“长江三峡旅游黄金线”和“八大特色旅游区”，共有景点300余处，其中国家级文物保护单位10多个。</p>  
                  </div>
                </div>                
              </div>
              <div class="templatemo-content-widget orange-bg">
                <i class="fa fa-times"></i>                
                <div class="media">
                  <div class="media-body" style="margin:0 auto; text-align: center;">
                  	<img src="images/chongqin.JPG" alt="chongqin" style="width:674px; height: 450px;">
                  </div>        
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
    <script src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>