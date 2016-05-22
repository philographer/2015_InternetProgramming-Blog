<!-- jsp_study_view.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:include page="jsp_study_checksession.jsp" flush="false"/>		<!-- 추가된 코드: 세션을 검사한다. -->
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>jsp visitor</title>
	<link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int v_id = -1;
	if (request.getParameter("v_id") != null)
	{
		v_id = Integer.parseInt(request.getParameter("v_id"));
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "update my_visitor set v_readcount = v_readcount + 1 where v_id = ?;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, v_id);

	int recordcnt = 0;	// 반영된 개수를 젖장
	try {
		recordcnt = pstmt.executeUpdate();	// DB에 update 요청
	}
	catch (Exception e) {
		recordcnt = 0;
	}

	if (recordcnt != 1) {
%>
		<script>
		alert('글을 조회하는데 실패하였습니다.');
		history.back();
		</script>
<%
	} else {
		sqlStr = "select v_id, v_title, v_readcount, v_author, v_adddate, v_upddate, v_content from my_visitor where v_id = ? limit 1;";
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1, v_id);

		ResultSet rset = pstmt.executeQuery();
		while ( rset.next() ) {
%>
	<h1 class="title">Visitor view</h1>
	<table>
		<tr>
			<th> 글 번호</th>
			<td><%= rset.getInt("v_id") %></td>
		</tr>
		<tr>
			<th> 제목</th>
			<td><%= rset.getString("v_title") %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= rset.getInt("v_readcount") %></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><%= rset.getString("v_author") %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%= rset.getString("v_adddate") %></td>
		</tr>
		<tr>
			<th>최종 수정일</th>
			<td><%= rset.getString("v_upddate") %></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><pre><%= rset.getString("v_content") %></pre></td>
		</tr>
		<tr>
			<td class="th_submit ta_c" colspan="2">
				<input type="button" value="글 목록" class="submit" onclick="location.href='jsp_visitor.jsp';">
				<input type="button" value="글 수정" class="submit" onclick="location.href='jsp_visitor_update.jsp?v_id=<%= rset.getInt("v_id") %>';">
				<input type="button" value="글 삭제" class="submit" onclick="location.href='jsp_visitor_delete.jsp?v_id=<%= rset.getInt("v_id") %>';">
			</td>
		</tr>
	</table>
<%
		}
		rset.close();
	}
	pstmt.close();
	conn.close();
%>

<%

/*
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
		Connection conn2 = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
		String sqlStr2 = "select v_id, v_author ,v_title, v_adddate, v_readcount from my_visitor order by v_id desc limit 5 offset ?;";
		String sql2 = "SELECT count(*) FROM My_visitor;"; 
		PreparedStatement pstmt2 = conn2.prepareStatement(sqlStr2); //정보 가져옴
		PreparedStatement stmt2 = conn2.prepareStatement(sql2);	//갯수 가져옴
		pstmt2.setInt(1, offset);

		ResultSet rset2 = pstmt2.executeQuery();
		ResultSet rs2 = null;
		rs2 = stmt2.executeQuery();
		rs2.next();
		totalRecord = rs2.getInt(1);

		if (totalRecord != 0) {
		   if (totalRecord % 5 == 0) {
		      totalPage = totalRecord / 5;
		   } else {
		      totalPage = totalRecord / 5 + 1;
		   }
		}

			*/

		request.setCharacterEncoding("UTF-8");
		int p = 1;
		int totalRecord = 0; //총 레코드 수를 저장할 변수
		int totalPage = 0; //총 페이지 수를 저장할 변수
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn2 = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
		String sql2 = "SELECT count(*) FROM My_visitor;"; 
		PreparedStatement stmt2 = conn2.prepareStatement(sql2);	//갯수 가져옴
		ResultSet rs2 = null;
		rs2 = stmt2.executeQuery();
		rs2.next();
		totalRecord = rs2.getInt(1);
		if (totalRecord != 0) {
		   if (totalRecord % 5 == 0) {
		      totalPage = totalRecord / 5;
		   } else {
		      totalPage = totalRecord / 5 + 1;
		   }
		}

		int curPage = (request.getParameter("v_id") == null) ? 1 : (totalRecord - Integer.parseInt(request.getParameter("v_id")))/5 + 1;
			if (request.getParameter("v_id") != null)
					{
						p = (totalRecord - Integer.parseInt(request.getParameter("v_id")))/5 + 1;
					}
					if (p <= 0)
						{
							p = 1;
					}
					int offset = (p - 1) * 5;

					String sqlStr2 = "select v_id, v_author ,v_title, v_adddate, v_readcount from my_visitor order by v_id desc limit 5 offset ?;";
					PreparedStatement pstmt2 = conn2.prepareStatement(sqlStr2); //정보 가져옴
					pstmt2.setInt(1, offset);
					ResultSet rset2 = pstmt2.executeQuery();
		%>
		<h1 class="title">-----------------------------List-----------------------------</h1>
		<table border="0">
			<tr>
				<th>Article Num</th>
				<th>Title</th>
				<th>Author</th>
				<th>Date</th>
				<th>View</th>
			</tr>
			<%
			while (rset2.next()) {
			%>
			<tr>
				<td class="ta_c"><%= rset2.getInt("v_id") %></td>
				<td>
					<a href='jsp_visitor_view.jsp?v_id=<%= rset2.getInt("v_id") %>' class="name">
						<%= rset2.getString("v_title") %>
					</a>
				</td>
				<td><%= rset2.getString("v_author") %></td>
				<td class="ta_c"><%= rset2.getString("v_adddate") %></td>
				<td class="ta_c"><%= rset2.getInt("v_readcount") %></td>
			</tr>
			<%
		}

				

				rset2.close();
				stmt2.close();
				pstmt2.close();
				conn2.close();

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




</body>
</html>

