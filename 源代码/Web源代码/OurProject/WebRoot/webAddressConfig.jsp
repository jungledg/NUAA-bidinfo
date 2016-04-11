<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String username = (String) session.getAttribute("username");
	if (username == null) {
		request.setAttribute("Error",
				"Session has ended. Please login.");
		RequestDispatcher rd = request
				.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		return;
	}
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>网址配置</title>
<meta name="description" content="">
<meta name="author" content="templatemo">

<link
	href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
	function add() {
		var nowRows = document.getElementById("mytable").rows;
		var rows1 = nowRows.length;
		var table1 = document.getElementById("mytable").insertRow(rows1);
		var addRow1 = table1.insertCell(0);
		var addRow2 = table1.insertCell(1);
		var addRow3 = table1.insertCell(2);
		var addRow4 = table1.insertCell(3);
		var x = document.getElementsByName("website")[0];

		addRow1.innerHTML = x.value;
		addRow2.innerHTML = "<input type='button' value='修改' onclick='change(this)' class='templatemo-blue-button width-100'/>";
		addRow3.innerHTML = "<input type='button' value='删除' onclick='del(this)' class='templatemo-blue-button width-100'/>";
		addRow4.innerHTML = "<input type='button' value='开始' onclick='start(this)' class='templatemo-blue-button width-100'/>";
		/* var x=document.getElementById('table1').insertCell(1)
			x.innerHTML="<input type='button' value='确定' onclick='sure(this)'/>"
		var x1=document.getElementById('table1').insertCell(2)
			x1.innerHTML="<input type='button' value='删除' onclick='del(this)'/>" */

		/* addRow2.innerHTML="<input type='button' value='确定' onclick='sure(this)'/>"; 
		addRow3.innerHTML="<input type='button' value='删除' onclick='del(this)'/>"; */
	}

	function del(tt) {
		var table2 = document.getElementById("mytable");
		table2.deleteRow(tt.parentNode.parentNode.rowIndex);
	}

	function sure(su) {
		var table4 = document.getElementById("mytable").rows;
		var rowss = su.parentNode.parentNode.rowIndex;
		/* var cellss=table4[rowss].cells[1];
		cellss.innerHTML=document.getElementById("id"+rowss).value; */
		var cellss2 = table4[rowss].cells[0];
		cellss2.innerHTML = document.getElementById("num" + rowss).value;
		var tableCell1 = su.parentNode;
		tableCell1.innerHTML = "<input type='button' value='修改' onclick='change(this)' class='templatemo-blue-button width-100'/>";
	}

	function change(ch) {
		var table3 = document.getElementById("mytable").rows;
		var rowss = ch.parentNode.parentNode.rowIndex;
		/* var cellss=table3[rowss].cells[1];
		var oldR=cellss.innerHTML;
		cellss.innerHTML="<input type='text' id='id"+rowss+"' value='' />";
		document.getElementById("id"+rowss).value=oldR; */
		var cellss2 = table3[rowss].cells[0];
		var oldR2 = cellss2.innerHTML;
		cellss2.innerHTML = "<input type='text' id='num"+rowss+"' value='' />";
		document.getElementById("num" + rowss).value = oldR2;
		var tableCell1 = ch.parentNode;
		tableCell1.innerHTML = "<input type='button' value='确定' onclick='sure(this)' class='templatemo-blue-button width-100'/>";
	}
	function start(qu) {
		var table3 = document.getElementById("mytable").rows;
		var rowss = qu.parentNode.parentNode.rowIndex;
		var s = table3[rowss].cells[0].innerHTML.toString();

		/* var jsonText = JSON.stringify(s);
		jQuery.ajax({
			type: "post",
			url: url,		
			dataType : 'json',		
			data : {'mydata':jsonText},		
			success: function(data,textStatus){		
				alert("操作成功");		
			},		
			error: function(xhr,status,errMsg){		
				alert("操作失败!");		
			}		
		}); */

		var tra = document.getElementById("tra");
		tra.value = s;
		document.getElementById('form').submit();
	}
</script>
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
				<img src="images/profile-photo.jpg" alt="Profile Photo"
					class="img-responsive">
				<div class="profile-photo-overlay"></div>
			</div>
			<!-- Search box -->
			<form class="templatemo-search-form" role="search">
				<div class="input-group">
					<button type="submit" class="fa fa-search"></button>
					<input type="text" class="form-control" placeholder="Search"
						name="srch-term" id="srch-term">
				</div>
			</form>
			<div class="mobile-menu-icon">
				<i class="fa fa-bars"></i>
			</div>
			<nav class="templatemo-left-nav">
				<ul>
					<li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>主页</a></li>
					<%
						String usertype = (String) session.getAttribute("usertype");
						if (usertype != null) {
							if (usertype.equals("1")) {
					%>
					<li><a href="#" class="active"><i
							class="fa fa-bar-chart fa-fw"></i>网址配置</a></li>
					<li><a href="dataAcquisition.jsp"><i
							class="fa fa-database fa-fw"></i>数据采集</a></li>
					<%
						}
						}
					%>
					<li><a href="projectQuery.jsp"><i
							class="fa fa-map-marker fa-fw"></i>项目查询</a></li>
					<li><a href="statisticalAnalysis.jsp"><i
							class="fa fa-users fa-fw"></i>统计分析</a></li>
					<li><a href="systemManagement.jsp"><i
							class="fa fa-sliders fa-fw"></i>系统管理</a></li>
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
								usertype = (String) session.getAttribute("usertype");
								if (usertype != null) {
									if (usertype.equals("1")) {
							%>
							<li><a href="#" class="active">网址配置</a></li>
							<li><a href="dataAcquisition.jsp">数据采集</a></li>
							<%
								}
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
				<div class="templatemo-content-widget white-bg">
					<div class="panel panel-default no-border">
						<div class="panel-heading border-radius-10">
							<h2 align="center">网址配置</h2>
						</div>
						<div class="panel-body">
							<div
								class="templatemo-flex-row flex-content-row margin-bottom-30">


								<div class="panel-body">
									<div
										class="templatemo-flex-row flex-content-row margin-bottom-30">
										<form name="form1" action="read_file" method="post"
											class="templatemo-login-form">
											
											<div class="input-group">
												手工方式输入：<br /> <input type="text" id="hand" name="website"
													style="width: 400px;" class="form-control"></input>
											</div>

											<div class="input-group">
												<input type="button" value="添加" onclick="add()"
													style="width: 400px; margin-top: 4px;"
													class="templatemo-blue-button width-100"></input>
											</div>
										</form>
										<br />
										<br />
									</div>
									<div class="templatemo-flex-row flex-content-row margin-bottom-30">

										<form method="post" action="UploadServlet"
											enctype="multipart/form-data">
											表格文件地址:<input type="file" name="file" size="60"/> <input
												type="submit" value="Upload"
												style="width: 400px; margin-top: 4px;"
												class="templatemo-blue-button width-100" />
										</form>
									</div>
										
										
									<div class="templatemo-flex-row flex-content-row margin-bottom-30">
										<form method="post" action="UploadServlet1"
											enctype="multipart/form-data">
											文本文件地址:<input type="file" name="file" size="60" /> 
											<input type="submit" value="Upload"
												style="width: 400px; margin-top: 4px;"
												class="templatemo-blue-button width-100" /><br />
										</form>


										<!-- </div> -->

									</div>
								</div>



							</div>
							<br />
							<br />
							<div
								class="templatemo-flex-row flex-content-row margin-bottom-30">

								<form name="form" id="form" action="web_spider" method="post">
									<div class="col-1">
										<div
											class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
											<i class="fa fa-times"></i>
											<div class="panel-heading templatemo-position-relative">
												<h2 class="text-uppercase">网址信息</h2>
											</div>
											<div class="table-responsive">
												<table id="mytable"
													class="table table-striped table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															<td style="width: 459px; "><b>网址</b></td>
															<td><b>修改</b></td>
															<td><b>删除</b></td>
															<td><b>开始</b></td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${projectlist3}" var="prolist">
															<tr>
																<td>${prolist}</td>
																<td><input type="button" value="修改"
																	style="button-align:center;" onclick="change(this)"
																	class="templatemo-blue-button width-100"></input></td>
																<td><input type="button" value="删除"
																	style="button-align:center;" onclick="del(this)"
																	class="templatemo-blue-button width-100"></input></td>
																<td><input type="button" value="开始"
																	onclick="start(this)"
																	class="templatemo-blue-button width-100"></input></td>
																
															</tr>
																<input type="hidden" id="tra" name="tra"
																	value="开始" onclick="start(this)"></input>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>
				<footer class="text-right" style="text-align: center;">
					<p>Copyright &copy; 2084 Company Name</p>
				</footer>
			</div>
		</div>
	</div>

	<!-- JS -->
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<!-- jQuery -->
	<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
	<!--  jQuery Migrate Plugin -->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<!-- Google Chart -->
	<script type="text/javascript" src="js/templatemo-script.js"></script>
	<!-- Templatemo Script -->
</body>
</html>