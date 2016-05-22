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

	String a_ArticleName  = request.getParameter("a_Article");
	String a_Eat_Time = request.getParameter("a_Eat_Time");
	String a_Eat_Place  = request.getParameter("a_Eat_Place");
	String a_Meal_Time  = request.getParameter("a_Meal_Time");
	String a_Food_Class  = request.getParameter("a_Food_Class");
	String a_content  = request.getParameter("a_content");
	
	

	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518","u12121518","5132@#");
	Statement stmt = conn.createStatement();
	

	//String sqlStr = "INSERT into tbshopuser (u_id, u_password, u_name, u_nickname,u_address,u_birthday,u_telePhone,u_chickPoint,u_eatoutPoint,u_LikeMostFood ) values ('" + u_id + "', '" + u_name + "', '"+email+"', '"+password +"');";
	String sqlStr = "INSERT into my_articles (a_ArticleName, a_Eat_Time, a_Eat_Place,a_Meal_Time,a_Food_Class,a_content) values (? , ? , ? , ? , ? , ?);";

	PreparedStatement pstmt = conn.prepareStatement(sqlStr);


	pstmt.setString(1, a_ArticleName);
	pstmt.setString(2, a_Eat_Time);
	pstmt.setString(3, a_Eat_Place);
	pstmt.setString(4, a_Meal_Time);
	pstmt.setString(5, a_Food_Class);
	pstmt.setString(6, a_content);

	
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
