<!-- jsp_study_update.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
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
	int d_articleNum = -1;

	if (request.getParameter("d_ArticleNum") != null)
	{
		d_articleNum =Integer.parseInt(request.getParameter("d_ArticleNum"));
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "UPDATE my_diary SET d_down=d_down + 1 WHERE d_ArticleNum= ? ;";

	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, d_articleNum);

	pstmt.executeUpdate();


	
	pstmt.close();
	conn.close();
%>

		<script>
		alert('반대하였습니다!');
		history.back();
		</script>
</body>
</html>

