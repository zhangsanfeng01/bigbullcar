<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>卖车信息填写</title>
    
	
	<style type="text/css">
	body{
	background:url(../resources/images/zbz-images/bgzbz2.jpg);}
	a{
	 color:#F39;
			text-decoration:none;
			font-size:35px;}
			
			.over{
			color:#0CC;
			font-weight:bold;
		}
		select{
		width:150px;
		line-height:40px;
		font-size:24px;}
		.input{
		border:solid 2px #900;}
		
		input.choosechange{
		line-height:30px;
		width:100px;}
		
		h2{text-align:center;
		}
		
		table{
		text-align:center;
		margin:auto auto;
		}
		
		li{
		float:left;
		margin:20px 50px;}
		
		#t2{
		padding:10px 100px 10px 100px;
				width:1330px;
				color:#F39;
				font-size:30px;
				font-width:bold;
		}
		
		input {
		background-color:#9FF;
		weight:80px;
		}
		#submit{
			background-color:#0CC;
		line-height:30px;
		weight:180px;
		font-size:24px;
		}
		
		#add{
		font-size:24px;
			background-color:#0CC;
		line-height:30px;
		weight:180px;
		}
		#t2 td{
		width:300px;
		height:100px;}
	
	</style>
	<script type="text/javascript" src="../resources/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../resources/js/tankuang-zbz.js"></script>
	<script type="text/javascript">
	$(function(){
  $("select,a").mouseover(function(){
  $(this).addClass("over");
  });
  $("select,a").mouseout(function(){
  $(this).removeClass("over");
  });
      $("input:text").blur(function(){
      if($(this).val()==""){
  $(this).next().css("display","inline");
  }else{
  $(this).next().css("display","none");
  }
  });
    $("input:text").mouseover(function(){
  $(this).addClass("input");
  });
  $("input:text").mouseout(function(){
  $(this).removeClass("input");
  });


	});
	 function addText(){
	var ulobj=document.getElementById("ul1");
	var liobj=document.createElement("li");
	liobj.setAttribute("name", "remove");
	var a=document.createElement("input");
	a.setAttribute("type","file");
	a.setAttribute("name","attachs");
	var b=document.createElement("input");
	b.setAttribute("type","button");
	b.setAttribute("value", "删除");
	b.setAttribute("onclick", "removeText()");
	liobj.appendChild(a);
	liobj.appendChild(b);
	ulobj.appendChild(liobj);
	}
	
	function removeText(){	
	 $.MsgBox.Confirm("温馨提示", "执行删除后将无法恢复，确定继续吗？", function () {
	 var ulobj=document.getElementById("ul1");
	var liobj=document.getElementsByName("remove");
	ulobj.removeChild(liobj[0]);  });
	} 
	</script>

  </head>
  
  <body>
    <table width="100%" height="100px">
					<tr>
						<td  width="20%">
							<img src="../resources/images/logo.png"  width="150px" height="100px"/>
						</td>
						<td width="10%"><a href="../user/userview?userName=${userName }" target="new" style="font-size:20px;">${userNames }</a></td>
						<td><a href="/bigbullcar/index.jsp" target="new">首页</a></td>
						<td><a href="buycar" target="new">买车</a></td>
						<td><a href="salecar" target="new">卖车</a></td>
						<td><a href="customercard" target="new">客服</a></td>
						<td>
							<a href="../resources/jsp/reg.jsp" target="new" class="indexzbz">注册</a>
						</td>
						<td>
								<c:if test="${userName==null }"><a href="./user/clear" target="new" class="indexzbz">登录</a></c:if>
						</td>
					</tr>
					</table>
					
					
				 <sf:form method="post" modelAttribute="carMessage" enctype="multipart/form-data" >
				<table id="t2" >
				<tr><td colspan="3"><h3>请真实填写车辆信息</h3></td></tr>
					<tr><td>
				汽车品牌<sf:select path="carbrand" class="choosechange">
			<sf:option value="奥迪">奥迪</sf:option>
			<sf:option value="宝马">宝马</sf:option>
			<sf:option value="奔驰">奔驰</sf:option>
			<sf:option value="法拉利">法拉利</sf:option>
			<sf:option value="比亚迪">比亚迪</sf:option>
			<sf:option value="别克">别克</sf:option>
			<sf:option value="大众">大众</sf:option>
			<sf:option value="兰博基尼">兰博基尼</sf:option>
			<sf:option value="五菱宏光">五菱宏光</sf:option>
			<sf:option value="捷达王">捷达王</sf:option>
			</sf:select>
			
			</td>
			<td>
			汽车类型<sf:select path="cartype" class="choosechange">
			<sf:option value="轿车">轿车</sf:option>
			<sf:option value="SUV">SUV</sf:option>
			<sf:option value="MPV">MPV</sf:option>
			<sf:option value="跑车">跑车</sf:option>
			</sf:select>
			</td>
			<td>
			汽车颜色<sf:select path="carcolor" class="choosechange">
			<sf:option value="红色">红色</sf:option>
			<sf:option value="黑色">黑色</sf:option>
			<sf:option value="白色">白色</sf:option>
			<sf:option value="银色">银色</sf:option>
			<sf:option value="绿色">绿色</sf:option>
			</sf:select>
			</td></tr>
			
		<tr><td>	售卖价格 (万)<sf:input path="carprice" class="choosechange" /><b style="color:#900;font-size:20px;display:none;" >*必填</b></td>
		<td>	行驶里程(Km)<sf:input path="carmileage" class="choosechange" /><b style="color:#900;font-size:20px;display:none;" >*必填</b></td>
		<td>	购车时间(年)<sf:input path="carage" class="choosechange" /><b style="color:#900;font-size:20px;display:none;" >*必填</b></td></tr>
				
			<tr><td colspan="3" rowspan="2" height="200px"> 
     
   车辆照片  <ul id=ul1>
      <li><input type="file" name="attachs" /></li>
      </ul>
    </td></tr>
    <tr></tr>
     <tr>
     <td><input type="button" value="新增" onclick="addText()" id="add" /></td>
     <td>   <input type="submit" value="保存" id="submit"   /></td>
     </tr>
   </table>
				</sf:form> 
			
  </body>
</html>
