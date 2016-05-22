<!-- jsp_study_view.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>jsp_nonmember</title>
	<link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int n_articleNum = -1;
	if (request.getParameter("n_ArticleNum") != null)
	{
		n_articleNum = Integer.parseInt(request.getParameter("n_ArticleNum"));
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "update my_nonmember set n_readcount = n_readcount + 1 where n_articleNum = ?;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, n_articleNum);

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
		out.print(pstmt);
		</script>
<%
	} else {
		sqlStr = "select n_articleNum,n_title,n_Write_Time,n_Eat_Time,n_Eat_Place,n_meal_Time,n_Food_Class,n_content,n_readcount,n_author,n_write_Update from my_nonmember where n_articleNum = ? limit 1;";
		pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1, n_articleNum);

		ResultSet rset = pstmt.executeQuery();
		while ( rset.next() ) {
%>
	<h1 class="title">Nonmember board</h1>
	<table>
		<tr>
			<th> 글 번호</th>
			<td><%= rset.getInt("n_articleNum") %></td>
		</tr>
		<tr>
			<th> 제목</th>
			<td><%= rset.getString("n_title") %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= rset.getInt("n_readcount") %></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><%= rset.getString("n_author") %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%= rset.getString("n_Write_Time") %></td>
		</tr>
		<tr>
			<th>최종 수정일</th>
			<td><%= rset.getString("n_write_Update") %></td>
		</tr>
		<tr>
			<th>먹은 날짜</th>
			<td><%= rset.getString("n_Eat_Time") %></td>
		</tr>
		<tr>
			<th>먹은 장소</th>
			<td><%= rset.getString("n_Eat_Place") %></td>
		</tr>
		<tr>
			<th>끼니</th>
			<td><%= rset.getString("n_meal_Time") %></td>
		</tr>
		<tr>
			<th>음식 종류</th>
			<td><%= rset.getString("n_Food_Class") %></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><pre><%= rset.getString("n_content") %></pre></td>
		</tr>
		
		<tr>
			<td class="th_submit ta_c" colspan="2">
				<input type="button" value="글 목록" class="submit" onclick="location.href='jsp_nonmember.jsp';">
				<input type="button" value="글 수정" class="submit" onclick="location.href='jsp_nonmember_update.jsp?n_articleNum=<%= rset.getInt("n_articleNum") %>';">
				<input type="button" value="글 삭제" class="submit" onclick="location.href='jsp_nonmember_delete.jsp?n_articleNum=<%= rset.getInt("n_articleNum") %>';">
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
	request.setCharacterEncoding("UTF-8");
		int p = 1;
		int totalRecord = 0; //총 레코드 수를 저장할 변수
		int totalPage = 0; //총 페이지 수를 저장할 변수
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn2 = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
		String sql2 = "SELECT count(*) FROM My_nonmember;"; 
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

		int curPage = (request.getParameter("n_ArticleNum") == null) ? 1 : (totalRecord - Integer.parseInt(request.getParameter("n_ArticleNum")))/5 + 1;
			if (request.getParameter("n_ArticleNum") != null)
					{
						p = (totalRecord - Integer.parseInt(request.getParameter("n_ArticleNum")))/5 + 1;
					}
					if (p <= 0)
						{
							p = 1;
					}
					int offset = (p - 1) * 5;

					String sqlStr2 = "select n_ArticleNum, n_author ,n_title, n_write_time, n_readcount from my_nonmember order by n_ArticleNum desc limit 5 offset ?;";
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
				<td class="ta_c"><%= rset2.getInt("n_ArticleNum") %></td>
				<td>
					<a href='jsp_nonmember_view.jsp?n_ArticleNum=<%= rset2.getInt("n_ArticleNum") %>' class="name">
						<%= rset2.getString("n_title") %>
					</a>
				</td>
				<td><%= rset2.getString("n_author") %></td>
				<td class="ta_c"><%= rset2.getString("n_write_time") %></td>
				<td class="ta_c"><%= rset2.getInt("n_readcount") %></td>
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
				<input type="button" value="새글 작성" class="submit" onclick="location.href='jsp_nonmember_new.jsp';">
				<input type="button" value="로그 아웃" class="submit" onclick="location.href='jsp_login_out.jsp';"> <!-- 로그아웃 버튼을 추가 -->
			</td>
		</tr>
		</table>
		<p class="nowpage"> [NowPage : <%out.print(curPage);%>] </p>
				<%
				if(curPage > 1 )
					{
				%>
				<a href="jsp_nonmember.jsp?p=<%=1%>" class="page"> [<<] </a>
				<a href="jsp_nonmember.jsp?p=<%=curPage-1 %>" class="page"> [<] </a>
				<%	}
				for( int i=startnum; i <= endnum; i++)
					{
						%>
							<a href ="jsp_nonmember.jsp?p=<%= i %>" class="page"><%= i %> </a>
						<% 	
					}
					if (curPage < totalPage) { %>

				<a href="jsp_nonmember.jsp?p=<%=curPage+1 %>" class="page"> [>] </a>
				<a href="jsp_nonmember.jsp?p=<%=totalPage%>" class="page"> [>>] </a>
				<%}
					%>
</body>
</html>

