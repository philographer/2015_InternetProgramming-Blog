	<!-- jsp_board.jsp -->
	<%@ page contentType="text/html;charset=utf-8" %>
	<%@ page import="java.sql.*" %>
	<!doctype html>
	<html>
	<head>
		<meta charset="utf-8"/>
		<link type="text/css" href="..\css\board.css" rel="stylesheet"/>
		<title>jsp_request</title>
	</head>
	<body>
		<h1 align="center" class="title">
				User account Board
		</h1>
				<hr align="left" style="width:387px;margin-right:auto;margin-left:auto">
		<%
		int curPage = (request.getParameter("p") == null) ? 1 : Integer.parseInt(request.getParameter("p"));
		int nextPage= 0;
		int prevPage= 0;
		ResultSet rs = null;

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");

		//게시판끝 http://www.java-school.net/jsp_request/BBS-Study 참조

		int totalRecord = 0; //총 레코드 수를 저장할 변수
		String sql = "SELECT count(*) FROM My_useraccount;"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		rs.next();
		totalRecord = rs.getInt(1);

		
		int totalPage = 0; //총 페이지 수를 저장할 변수

		if (totalRecord != 0) {
		   if (totalRecord % 3 == 0) {
		      totalPage = totalRecord / 3;
		   } else {
		      totalPage = totalRecord / 3 + 1;
		   }
		}

		request.setCharacterEncoding("UTF-8");
		int p = 1;
		if (request.getParameter("p") != null)
			{
		p = Integer.parseInt(request.getParameter("p"));
		}
		if (p <= 0)
			{
		p = 1;
			}
		int offset = (p-1) * 3;


		
		String sqlStr = "select * from My_useraccount order by u_id desc limit 3 offset ?;";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1, offset);


		ResultSet rset = pstmt.executeQuery();
		%>

		<%
		while (rset.next()) {
		%>

		<table border = "0">
				<tr>
					<th>ID</th>
					<td colspan="3"><%= rset.getString("u_id") %></td>
				</tr>
				<tr>
					<th>PW</th>
					<td colspan="3"><%= rset.getString("u_password") %></td>
				</tr>
				<tr>
					<th>NickName</th>
					<td colspan="3"><%= rset.getString("u_nickname") %></td>
				</tr>
				<tr>
					<th>Address</th>
					<td colspan="3"><%= rset.getString("u_address") %></td>
				</tr>
				<tr>
					<th>BirthDay</th>
					<td colspan="3"><%= rset.getString("u_birthday") %></td>
				</tr>
				<tr>
					<th>Telephone</th>
					<td colspan="3"><%= rset.getString("u_telePhone") %></td>
				</tr>
				<tr>
					<th>LikeMostFood</th>
					<td colspan="3"><%= rset.getString("u_LikeMostFood") %></td>
				</tr>
				<tr>
					<th>CreateTime</th>
					<td colspan="3"><%= rset.getString("create_time") %></td>
				</tr>
		<%
	}
	%>
	</table>
	<%
	stmt.close();
	rset.close();
	pstmt.close();
	conn.close();
	

	int startnum = 0;
	int endnum = 0;
	startnum = p-2;
	endnum = p+2;
	if(startnum < 1)
		{
		endnum += 1- startnum;
		startnum = 1;
	}

	if(endnum > totalPage)
	{
		endnum = totalPage;
	}
	%>
	<p class="nowpage"> [NowPage : <%out.print(curPage);%>] </p>
	<%
	if(curPage > 1 )
		{
	
	%>
	<a href="jsp_account_view.jsp?p=<%=1%>" class="page"> [<<] </a>
	<a href="jsp_account_view.jsp?p=<%=curPage-1 %>" class="page"> [<] </a>
	<%	}
	for( int i=startnum; i <= endnum; i++)
		{
			%>
				<a href ="jsp_account_view.jsp?p=<%= i %>" class="page"><%= i %> </a>
			<% 	
		}
		if (curPage < totalPage) { %>

	<a href="jsp_account_view.jsp?p=<%=curPage+1 %>" class="page"> [>] </a>
	<a href="jsp_account_view.jsp?p=<%=totalPage%>" class="page"> [>>] </a>
	<%}
		%>

				 <p align="right" >Copyright 2015~now by Yoohogyun. All Rights Reserved.</p>
	              <p align="right" >- last updated 15.3.27</p>
	</body>
	</html>


<!-- 
                  <td class="menu" style="font-size:20px">
                     <a href="html\write.html" target="_blank">Write</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
-->