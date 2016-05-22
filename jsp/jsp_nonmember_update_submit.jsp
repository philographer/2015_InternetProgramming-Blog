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
	String n_articleNum = request.getParameter("n_articleNum");
	String n_title = request.getParameter("n_title");
	String n_author = request.getParameter("n_author");
	String n_Eat_Time = request.getParameter("n_Eat_Time");
	String n_meal_Time = request.getParameter("n_meal_Time");
	String n_Food_Class = request.getParameter("n_Food_Class");
	String n_write_Update = request.getParameter("n_write_Update");
	String n_content = request.getParameter("n_content");
	String n_password = request.getParameter("n_password");


	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "UPDATE my_nonmember SET n_title = ?, n_Eat_Time = ?, n_meal_Time = ? , n_Food_Class = ? , n_content = ? , n_write_Update = CURRENT_TIMESTAMP  WHERE n_articleNum = ? AND n_password = ?;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, n_title);
	pstmt.setString(2, n_Eat_Time);
	pstmt.setString(3, n_meal_Time);
	pstmt.setString(4, n_Food_Class);
	pstmt.setString(5, n_content);
	pstmt.setString(6, n_articleNum);
	pstmt.setString(7, n_password);




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
		location.href = "jsp_nonmember_view.jsp?n_ArticleNum=<%= n_articleNum %>";
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
