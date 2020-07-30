<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/qna/qna_insert.css">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1 align="center">헤더 영역</h1>
	</header>
	<section>
		<h1>Q&A 글작성</h1>
		<hr>
		<form action="${pageContext.request.contextPath}/qnaController.do" method="post">
			<input type="hidden" name="command" value="writeres">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="member_id"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="qna_title"></td>
				</tr>
				<tr>
					<td colspan="2"><div id="editor" name="qna_content"></div></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="작성" onclick="formSubmit()">
					<input type="button" value="취소" 
					onclick="location.href='${pageContext.request.contextPath}/qnaController.do?command=list'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			previewStyle : 'tab',
			height : '400px',
			language : 'ko',
			initialEditType: 'wysiwyg'
		});

		editor.getHtml();
		
		function formSubmit() {
			let input = document.createElement("input");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "qna_content")
			input.setAttribute("value", editor.getHtml());
			document.querySelector("#editor").append(input);
		}
	</script>
</body>
</html>