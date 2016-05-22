<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>jsp_request</title>
</head>
<body>
		
	<%
	request.setCharacterEncoding("utf-8");

	String r_title  = request.getParameter("r_title");
	String r_name = request.getParameter("r_name");
	String r_content  = request.getParameter("r_content");

	

	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518","u12121518","5132@#");
	Statement stmt = conn.createStatement();
	

	//String sqlStr = "INSERT into tbshopuser (u_id, u_password, u_name, u_nickname,u_address,u_birthday,u_telePhone,u_chickPoint,u_eatoutPoint,u_LikeMostFood ) values ('" + u_id + "', '" + u_name + "', '"+email+"', '"+password +"');";
	String sqlStr = "INSERT into my_recommendations (r_title,r_name,r_content) values (? , ? , ?);";

	PreparedStatement pstmt = conn.prepareStatement(sqlStr);


	pstmt.setString(1, r_title);
	pstmt.setString(2, r_name);
	pstmt.setString(3, r_content);

	
	int recordcnt;
	try{
	recordcnt = pstmt.executeUpdate();
	//recordcnt = 1;
	}
	catch(Exception e)
	{
	recordcnt = 0;
	}

	if(recordcnt != 0)
		{
		response.sendRedirect("../html/jsp_response_article_success.html");
	}
	else
		{
	response.sendRedirect("../html/jsp_response_article_fail.html");
	out.print(pstmt);
	}
	stmt.close();
	conn.close();
	%>
	<input type = "button" value="이전 페이지" onclick="history.back();">
</body>
</html>
