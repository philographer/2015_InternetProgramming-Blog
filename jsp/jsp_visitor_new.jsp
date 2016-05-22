<!-- jsp_study_new.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<jsp:include page="jsp_study_checksession.jsp" flush="true"/>		<!-- 추가된 코드: 세션을 검사한다. -->
<%
	String login_author = "";
	if (session.getAttribute("author") != null)
	{
		login_author = session.getAttribute("author").toString();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<title class="title">게시판</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="../css/board.css">
	</head>
	<body>
		<h1>study board</h1>
		<form action="jsp_visitor_new_submit.jsp" method="post" accept-charset="utf-8">
			<table>
				<tr>
					<th>Title</th>
					<th><input type="text" name="title" size="60"></th>
				</tr>
				<tr>
					<th>Author</td>
					<td class="w3"><input type="text" name="author" readonly value="<%= login_author %>"></th>
				</tr>
				<tr>
					<th>PassWord</td>
					<td class="w3"><input type="password" name="password"></th>
				</tr>
				<tr>
					<th>Article</td>
					<td class="w3 h4"><textarea name="content" class="w4 hf"></textarea></th>
				</tr>
				<tr>
					<td class="th_submit ta_c" colspan="2">
						<input type="submit" value="작성 완료" class="submit">
						<input type="button" value="작성 취소" class="submit" onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script type="text/javascript"></script>
</html>