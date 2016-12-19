<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fenleishow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	
	body{
		background:url(./resources/images/buycarbg.jpg) no-repeat;
	background-size:1340px 1300px;
	}

	img{
	border:solid 2px red;}
	
	li {list-style-type:none;
	margin:1px;}
	
	ul{
	float:left;}
	
		a{
			text-decoration:none;
			font-size:35px;}
			
			#fenyediv{
			 text-align:center; 
			height:150px;
				
			}
			#fenyeul{
			width:1000px;
			overflow:hidden;
				}
				
			#fenyeul li{
			margin 5px 10px 5px 10px;
				display:inline;
}
			#tupian{
			width:1350px;
			height:850px;
			}
				.over{
			color:#900;
			font-weight:bold;
		}
	</style>
	
<script type="text/javascript" src="./resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
  $("select,a").mouseover(function(){
  $(this).addClass("over");
  });
  $("select,a").mouseout(function(){
  $(this).removeClass("over");
  });
  });
  </script>
  </head>
  
  <body>
    <div id="Container">
		<div id="Header">
			<table  width="1350px" height="180">
				<tr>
					<td width="200px"><img src="./resources/images/logo.png"
						width="150px" height="100px" /></td>
					<td><a href="./index.jsp" target="new" class="indexzbz"
						target="_blank">首页</a></td>
					<td><a href="bigbullcar/buycar" target="new" class="indexzbz">买车</a></td>
					<td><a href="bigbullcar/salecar" target="new" class="indexzbz">卖车</a></td>
					<td><a href="bigbullcar/customercard" target="new" class="indexzbz">客服</a></td>
					<%
						if (session.getAttribute("userName") == null) {
					%>

					<td><a href="./user/clear" target="new">登录</a></td>
					<td><a href="./resources/jsp/reg.jsp" target="new">注册</a></td>

					<%
						} else {
					%>
					<td><h3>你好：</h3>
					<a href="./user/userview?userName=${userName }"
						target="new"><%=session.getAttribute("userName")%></a></td>
					<td>
						<form action="./resources/jsp/loginOut.jsp" method="post">
							<input type="submit" value="注销" style="width:100px; height:50px;color:blue">
						</form>
					</td>

					<%
						}
					%>
					
				</tr>

				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>

		</div>
				
				<div id="bg" >
			<div id="tupian"   >
		      
			<c:forEach items="${carmessageList }" var="ul" begin="${start }" end="${end }">
			<ul style="color:green">
			<li><a href="bigbullcar/buycar/${ul.carid }"><img src="./resources/images/zbz-images/${ul.carphoto }.1.jpg" width="400px" height="300px"></a></li>
			<li><c:if test="${ul.carstate == 1 }">在售</c:if>
			<c:if test="${ul.carstate == 0 }">已被预定</c:if>
			<c:if test="${ul.carstate == -1 }">已出售</c:if>
			</li>
			<li>品牌：${ul.carbrand }</li>
			<li>类型：${ul.cartype }</li>
			<li>价格:${ul.carprice }万</li>
			</ul>
			</c:forEach>
		</div>
			<div id="fenyediv" >
			<ul id="fenyeul">
				<li>
				     <c:if test="${brand1==1111}">
					 <a href="bigbullcar/brand/${carBrand }/${curpage-1 }">上一页</a>
					 </c:if>
					 <c:if test="${brand1==2222 }">
					 <a href="bigbullcar/price/${carBrand }/${curpage-1 }">上一页</a>
					 </c:if>
					 <c:if test="${brand1==3333 }">
					 <a href="bigbullcar/type/${carBrand }/${curpage-1 }">上一页</a>
					 </c:if>
				</li>
				<li>
					  <c:if test="${brand1==1111}">
					 <a href="bigbullcar/brand/${carBrand }/">${curpage }/${pagenum }</a>
					 </c:if>
					 <c:if test="${brand1==2222 }">
					 <a href="bigbullcar/price/${carBrand }/">${curpage }/${pagenum }</a>
					 </c:if>
					 <c:if test="${brand1==3333 }">
					 <a href="bigbullcar/type/${carBrand }/">${curpage }/${pagenum }</a>
					 </c:if>
				</li>
				
				<li>
				<c:if test="${brand1==1111}">
					 <a href="bigbullcar/brand/${carBrand }/${curpage+1 }">下一页</a>
					 </c:if>
					 <c:if test="${brand1==2222 }">
					 <a href="bigbullcar/price/${carBrand }/${curpage+1 }">下一页</a>
					 </c:if>
					 <c:if test="${brand1==3333 }">
					 <a href="bigbullcar/type/${carBrand }/${curpage+1 }">下一页</a>
					 </c:if>
					
				</li>
				
			</ul>
			</div>
		</div>
  </body>
</html>
