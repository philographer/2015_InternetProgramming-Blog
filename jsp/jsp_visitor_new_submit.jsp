<!-- jsp_study_new_submit.jsp -->
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
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String password = request.getParameter("password");
	String content = request.getParameter("content");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "INSERT INTO my_visitor (v_title, v_author, v_content, v_password) VALUES (?, ?, ?, ?);";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, title);
	pstmt.setString(2, author);
	pstmt.setString(3, content);
	pstmt.setString(4, password);

	int recordcnt = 0;	// 반영된 개수를 젖장
	try {
		recordcnt = pstmt.executeUpdate();	// DB에 insert 요청
	}
	catch (Exception e) {
		recordcnt = 0;
	}

	if (recordcnt == 1) {
		%>
		<script>
		alert('글 작성에 성공하였습니다.');
		location.href = "jsp_visitor.jsp";
		</script>
		<%
	} else {
		%>
		<script>
		alert('글 작성에 실패하였습니다.');
		history.back();
		</script>
		<%
	}
	pstmt.close();
	conn.close();
	%>
</body>
</html>
