<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="MyinfoController?command=myinfoUpdate" method="post">
<input type="hidden" name="member_id" value="${dto.member_id}">
	<table>
		<tr>
			<th>아이디</th>
			<td>${dto.member_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.member_name}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${dto.member_email}"/></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" value="${dto.member_addr}"/></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정"/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>