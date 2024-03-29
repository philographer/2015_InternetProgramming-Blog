<!-- jsp_study_delete_submit.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:include page="jsp_study_checksession.jsp" flush="false"/>		<!-- 추가된 코드: 세션을 검사한다. -->
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String v_id = request.getParameter("v_id");
	String v_password = request.getParameter("v_password");
	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "DELETE FROM my_visitor WHERE v_id = ? AND v_password = ?;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, v_id);
	pstmt.setString(2, v_password);

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
		alert('글 삭제에 성공하였습니다.');
		location.href = "jsp_visitor.jsp";
		</script>
		<%
	} else {
		%>
		<script>
		alert('글 삭제에 실패하였습니다.');
		history.back();
		</script>
		<%
	}
	pstmt.close();
	conn.close();
	%>
</body>
</html>
