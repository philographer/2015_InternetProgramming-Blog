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

	String n_title  = request.getParameter("n_Article");
	String n_author =  request.getParameter("n_author");
	String n_Eat_Time = request.getParameter("n_Eat_Time");
	String n_Eat_Place  = request.getParameter("n_Eat_Place");
	String n_Meal_Time  = request.getParameter("n_Meal_Time");
	String n_Food_Class  = request.getParameter("n_Food_Class");
	String n_content  = request.getParameter("n_content");
	String n_password  = request.getParameter("n_password");

	
	

	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518","u12121518","5132@#");
	Statement stmt = conn.createStatement();
	

	//String sqlStr = "INSERT into tbshopuser (u_id, u_password, u_name, u_nickname,u_address,u_birthday,u_telePhone,u_chickPoint,u_eatoutPoint,u_LikeMostFood ) values ('" + u_id + "', '" + u_name + "', '"+email+"', '"+password +"');";
	String sqlStr = "INSERT into my_nonmember (n_title, n_author, n_Eat_Time,n_Eat_Place,n_Meal_Time,n_Food_Class,n_content,n_password) values (? , ? , ? , ? , ? , ?, ?,?);";

	PreparedStatement pstmt = conn.prepareStatement(sqlStr);


	pstmt.setString(1, n_title);
	pstmt.setString(2, n_author);
	pstmt.setString(3, n_Eat_Time);
	pstmt.setString(4, n_Eat_Place);
	pstmt.setString(5, n_Meal_Time);
	pstmt.setString(6, n_Food_Class);
	pstmt.setString(7, n_content);
	pstmt.setString(8, n_password);

	
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
