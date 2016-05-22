<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="js\notice.js"></script>
	<link type="text/css" href="..\css\account.css" rel="stylesheet"/>
	<title>jsp_request</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String Ids = request.getParameter("Ids");
		String Pws = request.getParameter("Pws");

		Class.forName("com.mysql.jdbc.Driver");//드라이버 호출
		Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518","u12121518","5132@#");
		Statement stmt = conn.createStatement();//실제 연결 구축

		//String sqlStr = "SELECT * FROM tbshopuser WHERE u_id='" + id + "' and password = '" + pw + "';";//' ' : sql 의 문자열 표시 , "" Javascript의 문자열 표시 

		String sqlStr = "SELECT * FROM my_useraccount WHERE u_id=? and u_password=?;";

		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setString(1, Ids);
		pstmt.setString(2, Pws);

		//ResultSet rset = stmt.executeQuery(sqlStr);//쿼리를 날리고 result table을 받음
		
		ResultSet rset = pstmt.executeQuery();

		String name = "";

		while(rset.next())//1개있으면 1, 2개있으면 2, 3개있으면.... 없으면 0
		{
		name = rset.getString("u_id");
		}

		if (name == "")
		{
		response.sendRedirect("../html/jsp_response_fail.html");
		}
		else
		{
			session.setAttribute("id", Ids);
			session.setAttribute("author", Ids);
			session.setAttribute("pw", Pws);

			if(Ids.equals("admin"))
			{
				%>
				<table borderder="1">
				<tr>
					<th>name</th>
				</tr>
				<%
					sqlStr = "SELECT u_id, u_password FROM my_useraccount;";
					rset = stmt.executeQuery(sqlStr);

					while (rset.next()){
					%>
						<tr>
							<td><%= rset.getString("u_id") %> </td>
							<td><%= rset.getString("u_password") %> </td>
						</tr>
					<%
					}
					%>
					</table>
				<%
			}

			else
			{ %>

  				 <script type="text/javascript"> 
  				 	opener.location.reload();
  				 	window.parent.focus();
  				 	//self.close();
  				 	location.replace("../html/jsp_response_success.jsp");
  				 </script>

			<%
			}
		}
		rset.close();
		stmt.close();
		conn.close();
		/*
		if (id.equals("admin") && pw.equals("1234")) {
			response.sendRedirect("jsp_response_success.html");
		} else {
			response.sendRedirect("jsp_response_fail.html");
		}
		*/
	%>
</body>
</html>
