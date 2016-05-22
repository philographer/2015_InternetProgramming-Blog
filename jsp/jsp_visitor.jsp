<!-- jsp_study_board.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:include page="jsp_study_checksession.jsp" flush="false"/>		<!-- 추가된 코드: 세션을 검사한다. -->
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	<title >Visitor</title>
	<link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int p = 1;
	int curPage = (request.getParameter("p") == null) ? 1 : Integer.parseInt(request.getParameter("p"));
	int totalRecord = 0; //총 레코드 수를 저장할 변수
	int totalPage = 0; //총 페이지 수를 저장할 변수
	
	if (p <= 0)
			{
				p = 1;
			}
		
	if (request.getParameter("p") != null)
			{
				p = Integer.parseInt(request.getParameter("p"));
			}
		
		int offset = (p - 1) * 5;

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");

		String sqlStr = "select v_id, v_author ,v_title, v_adddate, v_readcount from my_visitor order by v_id desc limit 5 offset ?;";
		String sql = "SELECT count(*) FROM My_visitor;"; 
		PreparedStatement pstmt = conn.prepareStatement(sqlStr); //정보 가져옴
		PreparedStatement stmt = conn.prepareStatement(sql);	//갯수 가져옴
		pstmt.setInt(1, offset);

		ResultSet rset = pstmt.executeQuery();
		ResultSet rs = null;
		rs = stmt.executeQuery();
		rs.next();
		totalRecord = rs.getInt(1);

		if (totalRecord != 0) {
		   if (totalRecord % 5 == 0) {
		      totalPage = totalRecord / 5;
		   } else {
		      totalPage = totalRecord / 5 + 1;
		   }
		}


		%>
		<h1 class="title">Visitors's book</h1>
		<table border="0">
			<tr>
				<th>Article Num</th>
				<th>Title</th>
				<th>Author</th>
				<th>Date</th>
				<th>View</th>
			</tr>
			<%
			while (rset.next()) {
			%>
			<tr>
				<td class="ta_c"><%= rset.getInt("v_id") %></td>
				<td>
					<a href='jsp_visitor_view.jsp?v_id=<%= rset.getInt("v_id") %>' class="name">
						<%= rset.getString("v_title") %>
					</a>
				</td>
				<td><%= rset.getString("v_author") %></td>
				<td class="ta_c"><%= rset.getString("v_adddate") %></td>
				<td class="ta_c"><%= rset.getInt("v_readcount") %></td>
			</tr>
			<%
		}

				

				rset.close();
				stmt.close();
				pstmt.close();
				conn.close();

				int startnum = 0;
				int endnum = 0;
				startnum = p-1;
				endnum = p+1;
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

		<tr>
			<td colspan="5" class="th_submit ta_c">
				<input type="button" value="새글 작성" class="submit" onclick="location.href='jsp_visitor_new.jsp';">
				<input type="button" value="로그 아웃" class="submit" onclick="location.href='jsp_login_out.jsp';"> <!-- 로그아웃 버튼을 추가 -->
			</td>
		</tr>
		</table>
		<p class="nowpage"> [NowPage : <%out.print(curPage);%>] </p>
				<%
				if(curPage > 1 )
					{
				%>
				<a href="jsp_visitor.jsp?p=<%=1%>" class="page"> [<<] </a>
				<a href="jsp_visitor.jsp?p=<%=curPage-1 %>" class="page"> [<] </a>
				<%	}
				for( int i=startnum; i <= endnum; i++)
					{
						%>
							<a href ="jsp_visitor.jsp?p=<%= i %>" class="page"><%= i %> </a>
						<% 	
					}
					if (curPage < totalPage) { %>

				<a href="jsp_visitor.jsp?p=<%=curPage+1 %>" class="page"> [>] </a>
				<a href="jsp_visitor.jsp?p=<%=totalPage%>" class="page"> [>>] </a>
				<%}
					%>
			<!--
				<%
				for (int i=startnum; i<=endnum; i++)
					{
				%>
				<a href="jsp_	visitor.jsp?p=<%= i %>" class="page">[ <%= i %> ]</a>
			
				<%
			}
			%>
			-->
		</body>
		</html>

