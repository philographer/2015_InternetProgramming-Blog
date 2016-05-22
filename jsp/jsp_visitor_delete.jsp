<!-- jsp_study_delete.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:include page="jsp_study_checksession.jsp" flush="false"/>		<!-- 추가된 코드: 세션을 검사한다. -->
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
	int v_id = -1;
	if (request.getParameter("v_id") != null)
	{
		v_id = Integer.parseInt(request.getParameter("v_id"));
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "";
	PreparedStatement pstmt = null;
	
	sqlStr = "select v_id,v_title from my_visitor where v_id = ? limit 1;";
	pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, v_id);

	ResultSet rset = pstmt.executeQuery();
	while ( rset.next() ) {
%>
	<h1 class="title">Delete Article</h1>
	<form action="jsp_visitor_delete_submit.jsp" method="post">
		<table>
			<tr>
				<th>Article Num</th>
				<td><%= rset.getInt("v_id") %><input type="hidden" name="v_id" size="60" value='<%= rset.getInt("v_id") %>'></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><%= rset.getString("v_title") %></td>
			</tr>
			
			<tr>
				<th>PassWord</th>
				<td><input type="password" name="v_password" size="60"></td>
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
