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

	String d_title  = request.getParameter("d_title");
	String d_author =  request.getParameter("d_author");
	String d_Eat_Time = request.getParameter("d_Eat_Time");
	String d_Eat_Place  = request.getParameter("d_Eat_Place");
	String d_Meal_Time  = request.getParameter("d_Meal_Time");
	String d_Food_Class  = request.getParameter("d_Food_Class");
	String d_content  = request.getParameter("d_content");
	String d_password  = request.getParameter("d_password");

	
	

	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518","u12121518","5132@#");
	Statement stmt = conn.createStatement();
	

	//String sqlStr = "INSERT into tbshopuser (u_id, u_password, u_name, u_nickname,u_address,u_birthday,u_telePhone,u_chickPoint,u_eatoutPoint,u_LikeMostFood ) values ('" + u_id + "', '" + u_name + "', '"+email+"', '"+password +"');";
	String sqlStr = "INSERT into my_diary (d_title, d_author, d_Eat_Time,d_Eat_Place,d_Meal_Time,d_Food_Class,d_content,d_password) values (? , ? , ? , ? , ? , ?, ?, ?);";

	PreparedStatement pstmt = conn.prepareStatement(sqlStr);



	pstmt.setString(1, d_title);
	pstmt.setString(2, d_author);
	pstmt.setString(3, d_Eat_Time);
	pstmt.setString(4, d_Eat_Place);
	pstmt.setString(5, d_Meal_Time);
	pstmt.setString(6, d_Food_Class);
	pstmt.setString(7, d_content);
	pstmt.setString(8, d_password);

	

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
	//response.sendRedirect("../html/jsp_response_article_fail.html");
	out.print(pstmt);

	}
	stmt.close();
	conn.close();
	%>
	<input type = "button" value="이전 페이지" onclick="history.back();">
</body>
</html>
