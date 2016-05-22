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
				diary Board
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
		String sql = "SELECT count(*) FROM My_diary;"; 
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


		
		String sqlStr = "select * from My_diary order by d_ArticleNum desc limit 3 offset ?;";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1, offset);


		ResultSet rset = pstmt.executeQuery();
		%>

		<%
		while (rset.next()) {
		%>

		<table border = "0">
				<tr>
					<th>Article_Num</th>
					<td><%= rset.getString("d_ArticleNum") %></td>
					<th style="color:#dc143c;">Title</th>
					<td ><%=rset.getString("d_title") %></td>
				</tr>
				<tr>
					<th>Write_Time</th>
					<td colspan="3"><%= rset.getString("d_Write_Time") %></td>
				</tr>
				<tr>
					<th>Content</th>
					<td colspan="3"><%= rset.getString("d_content") %></td>
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
	<a href="jsp_admin_diary.jsp?p=<%=1%>" class="page"> [<<] </a>
	<a href="jsp_admin_diary.jsp?p=<%=curPage-1 %>" class="page"> [<] </a>
	<%	}
	for( int i=startnum; i <= endnum; i++)
		{
			%>
				<a href ="jsp_admin_diary.jsp?p=<%= i %>" class="page"><%= i %> </a>
			<% 	
		}
		if (curPage < totalPage) { %>

	<a href="jsp_admin_diary.jsp?p=<%=curPage+1 %>" class="page"> [>] </a>
	<a href="jsp_admin_diary.jsp?p=<%=totalPage%>" class="page"> [>>] </a>
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