<!-- jsp_study_delete.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Dlete Visitor Article</title>
	<link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int n_articleNum = -1;
	if (request.getParameter("n_articleNum") != null)
	{
		n_articleNum = Integer.parseInt(request.getParameter("n_articleNum"));
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "";
	PreparedStatement pstmt = null;
	
	sqlStr = "select n_articleNum,n_title from my_nonmember where n_articleNum = ? limit 1;";
	pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, n_articleNum);

	ResultSet rset = pstmt.executeQuery();
	while ( rset.next() ) {
%>
	<h1 class="title">Delete Article</h1>
	<form action="jsp_nonmember_delete_submit.jsp" method="post">
		<table>
			<tr>
				<th>Article Num</th>
				<td><%= rset.getInt("n_articleNum") %><input type="hidden" name="n_articleNum" size="60" value='<%= rset.getInt("n_articleNum") %>'></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><%= rset.getString("n_title") %></td>
			</tr>
			
			<tr>
				<th>PassWord</th>
				<td><input type="password" name="n_password" size="60"></td>
			</tr>
			<tr>
				<td class="th_submit ta_c" colspan="2">
					<input type="button" value="삭제 취소" class="submit" onclick="history.back();">
					<input type="submit" value="글 삭제" class="submit">
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
