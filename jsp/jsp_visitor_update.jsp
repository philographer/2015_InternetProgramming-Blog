<!-- jsp_study_update.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:include page="jsp_study_checksession.jsp" flush="false"/>		<!-- 추가된 코드: 세션을 검사한다. -->
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Visitor</title>
	<link type="text/css" href="..\css\board.css" rel="stylesheet"/>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int v_id = -1;
	if (request.getParameter("v_id") != null)
	{
		v_id = Integer.parseInt(request.getParameter("v_id"));
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "";
	PreparedStatement pstmt = null;
	
	sqlStr = "select v_id, v_title, v_readcount, v_author, v_adddate, v_upddate, v_content from my_visitor where v_id = ? limit 1;";
	pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, v_id);

	ResultSet rset = pstmt.executeQuery();
	while ( rset.next() ) {
%>
	<h1 class="title"> Visitor update </h1>
	<form action="jsp_visitor_update_submit.jsp" method="post">
		<table>
			<tr>
				<th>ArticleNum</th>
				<td><%= rset.getInt("v_id") %><input type="hidden" name="s_id" size="60" value='<%= rset.getInt("v_id") %>'></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" class="text" name="title" size="60" value='<%= rset.getString("v_title") %>'></td>
			</tr>
			<tr>
				<th>Author</th>
				<td><input type="text" class="text" name="author" size="60" value='<%= rset.getString("v_author") %>'></td>
			</tr>
			<tr>
				<th>Date</th>
				<td><%= rset.getString("v_adddate") %></td>
			</tr>
			<tr>
				<th>Last Updated</th>
				<td><%= rset.getString("v_upddate") %></td>
			</tr>
			<tr>
				<th>Article</th>
				<td><textarea name="content" class="w4 hf"><%= rset.getString("v_content") %></textarea></td>
			</tr>
			<tr>
				<th>PassWord</th>
				<td><input type="password" clss="passsword" name="password" size="60"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정 취소"  onclick="history.back();">
					<input type="submit" value="글 수정" >
				</td>
			</tr>
		</table>
	</form>
<%
	}
	rset.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>

