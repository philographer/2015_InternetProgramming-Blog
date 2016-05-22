<!-- jsp_study_update_submit.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String d_articleNum = request.getParameter("d_articleNum");
	String d_title = request.getParameter("d_title");
	String d_author = request.getParameter("d_author");
	String d_Eat_Time = request.getParameter("d_Eat_Time");
	String d_meal_Time = request.getParameter("d_meal_Time");
	String d_Food_Class = request.getParameter("d_Food_Class");
	String d_write_Update = request.getParameter("d_write_Update");
	String d_content = request.getParameter("d_content");
	String d_password = request.getParameter("d_password");


	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "UPDATE my_diary SET d_title = ?, d_Eat_Time = ?, d_meal_Time = ? , d_Food_Class = ? , d_content = ? , d_write_Update = CURRENT_TIMESTAMP  WHERE d_articleNum = ? AND d_password = ?;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, d_title);
	pstmt.setString(2, d_Eat_Time);
	pstmt.setString(3, d_meal_Time);
	pstmt.setString(4, d_Food_Class);
	pstmt.setString(5, d_content);
	pstmt.setString(6, d_articleNum);
	pstmt.setString(7, d_password);




	int recordcnt = 0;	// 반영된 개수를 젖장
	try {
		recordcnt = pstmt.executeUpdate();	// DB에 update 요청
	}
	catch (Exception e) {
		recordcnt = 0;
	}

	if (recordcnt == 1) {
		%>
		<script>
		alert('글 수정에 성공하였습니다.');
		location.href = "jsp_diary_view.jsp?d_ArticleNum=<%= d_articleNum %>";
		</script>
		<%
	} else {
		%>
		<script>
		alert('글 수정에 실패하였습니다.');
		history.back();
		out.print(pstmt);
		</script>

		<%
	}
	pstmt.close();
	conn.close();
	%>
</body>
</html>
