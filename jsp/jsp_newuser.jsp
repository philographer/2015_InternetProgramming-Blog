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

	String u_id = request.getParameter("Ids");
	String u_password = request.getParameter("Pws");
	String u_nickname = request.getParameter("NickName");
	String u_address = request.getParameter("Address");
	String u_birthday = request.getParameter("BirthDay");
	String u_telePhone = request.getParameter("TelePhone");
	String u_chickPoint = request.getParameter("ChickPoint");
	String u_eatoutPoint = request.getParameter("EatOutPoint");
	String u_LikeMostFood = request.getParameter("LikeMostFood");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518","u12121518","5132@#");
	Statement stmt = conn.createStatement();
	

	//String sqlStr = "INSERT into tbshopuser (u_id, u_password, u_name, u_nickname,u_address,u_birthday,u_telePhone,u_chickPoint,u_eatoutPoint,u_LikeMostFood ) values ('" + u_id + "', '" + u_name + "', '"+email+"', '"+password +"');";
	String sqlStr = "INSERT into my_UserAccount (u_id, u_password, u_nickname,u_birthday,u_address,u_telePhone,u_chickPoint,u_eatoutPoint,u_LikeMostFood ) values (? , ? , ? , ? , ? , ? , ? , ? , ? );";

	PreparedStatement pstmt = conn.prepareStatement(sqlStr);

	pstmt.setString(1, u_id);
	pstmt.setString(2, u_password);
	pstmt.setString(3, u_nickname);
	pstmt.setString(4, u_birthday);
	pstmt.setString(5, u_address);
	pstmt.setString(6, u_telePhone);
	pstmt.setString(7, u_chickPoint);
	pstmt.setString(8, u_eatoutPoint);
	pstmt.setString(9, u_LikeMostFood);

	int recordcnt;
	try{
	out.print(pstmt);
	recordcnt = pstmt.executeUpdate();
	//recordcnt = 1;
	}
	catch(Exception e)
	{
	recordcnt = 0;
	}

	if(recordcnt != 0)
		{
		response.sendRedirect("../html/jsp_response_account_success.html");
	}
	else
		{
	response.sendRedirect("../html/jsp_response_account_fail.html");

	}
	stmt.close();
	conn.close();
	%>
	<input type = "button" value="이전 페이지" onclick="history.back();">
</body>
</html>
