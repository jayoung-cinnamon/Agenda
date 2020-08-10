<%@page import="com.agenda.admin.adDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 정보 조회</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<style type="text/css">

	#allmemberlist {
		width: 100vw;
		display: flex;
		justify-content: center;
		height : 100%;
		background-color: whitesmoke;
	}
	
	#title {
		font-size: 16pt;
		text-align: center;
	}
	
	#update {
		background-color: gold;
		cursor: pointer;
	}
	
	#back {
		background-color: black;
		color: white;
		cursor: pointer;
	}
	
	
	table{
		border-collapse: collapse;
		width : 1200px;
		margin-top : 100px;
		margin-bottom: 50px;
	}
	
	tr,td{
		padding : 5px;
	}
	
</style>
<script type="text/javascript">

function changeRole(member_id){
	location.href="../Agenda/adController?command=allUpdate&member_id="+member_id;
}

</script>
</head>
<body>
<%
	List<adDto> list = (List<adDto>)request.getAttribute("list");
%>
<c:choose>
    	<c:when test="${empty logindto }">
    		<jsp:include page="../header/header.jsp" />
    	</c:when>
    	<c:otherwise>
    		<jsp:include page="../header/loginMain.jsp" />
    	</c:otherwise>
	</c:choose>
	
	<section>
<div id="allmemberlist">
	<table border="1">
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
			<tr>
				<td id="title" colspan="10">전체 회원 정보 조회</td>
			</tr>
			<tr>
				<td>번    호</td>
				<td>I   D</td>
				<td>P   W</td>
				<td>이     름</td>	
				<td>이 메 일</td>
				<td>핸 드 폰</td>
				<td>주     소</td>
				<td>활 성 화</td>
				<td>등     급</td>
				<td>등급변경</td>
			</tr>
<%
		if (list.size() == 0 ) {
%>
		<tr>
			<td>-----회원 정보가 없습니다.-----</td>
		</tr>
<%
		} else {
			for (adDto dto : list) {
%>
		<tr>
			<td><%=dto.getMember_no() %></td>
			<td><%=dto.getMember_id() %></td>
			<td><%=dto.getMember_pw() %></td>
			<td><%=dto.getMember_name() %></td>
			<td><%=dto.getMember_email() %></td>
			<td><%=dto.getMember_addr() %></td>
			<td><%=dto.getMember_phone() %></td>
			<td><%=dto.getMember_enabled() %></td>
			<td><%=dto.getMember_role() %></td>
			<td><button id="update" onclick="changeRole('<%=dto.getMember_id() %>');">변경</button></td>
		</tr>
<%
			}
		}
%>
		<tr>
			<td colspan="10"><input id="back" type="button" onclick="location.href='admin/adlayout.jsp'" value="돌아가기"/></td>
		</tr>
	</table>

</div>

</section>

<!-- 풋터-->
	<jsp:include page="../footer/mainFooter.jsp" />
	
	
</body>
</html>