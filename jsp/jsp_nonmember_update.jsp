<!-- jsp_study_update.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Visitor</title>
	<link type="text/css" href="..\css\board.css" rel="stylesheet"/>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int n_articleNum = -1;
	if (request.getParameter("n_articleNum") != null)
	{
		n_articleNum = Integer.parseInt(request.getParameter("n_articleNum"));
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://165.246.43.209:13306/db12121518", "u12121518", "5132@#");
	
	String sqlStr = "";
	PreparedStatement pstmt = null;
	
	sqlStr = "select n_articleNum, n_title, n_author, n_Eat_Time, n_Eat_Place, n_meal_Time, n_Food_Class,n_Write_Time,n_write_Update,n_content from my_nonmember where n_articleNum = ? limit 1;";
	pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, n_articleNum);

	ResultSet rset = pstmt.executeQuery();
	while ( rset.next() ) {
%>
	<h1 class="title"> Visitor update </h1>
	<form action="jsp_diary_update_submit.jsp" method="post">
		<table>
			<tr>
				<th>ArticleNum</th>
				<td><%= rset.getInt("n_articleNum") %><input type="hidden" name="n_articleNum" size="60" value='<%= rset.getInt("n_articleNum") %>'></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" class="text" name="n_title" size="60" value='<%= rset.getString("n_title") %>'></td>
			</tr>
			<tr>
				<th>Author</th>
				<td><%= rset.getString("n_author") %><input type="hidden" name="n_author" size="60" value='<%= rset.getString("n_author") %>'></td>
			</tr>
			<tr>
				<th>먹은 날짜</th>
				<td><input type="text" class="text" name="n_Eat_Time" size="60" value='<%= rset.getString("n_Eat_Time") %>'></td>
			</tr>
			<tr>
				<th>먹은 장소</th>
				<td><input type="text" class="text" name="n_Eat_Place" size="60" value='<%= rset.getString("n_Eat_Place") %>'></td>
			</tr>
			<tr>
				<th>끼니</th>
				<td><input type="text" class="text" name="n_meal_Time" size="60" value='<%= rset.getString("n_meal_Time") %>'></td>
			</tr>
			<tr>
				<th>음식 종류</th>
				<td><input type="text" class="text" name="n_Food_Class" size="60" value='<%= rset.getString("n_Food_Class") %>'></td>
			</tr>

			<tr>
				<th>Write Date</th>
				<td><%= rset.getString("n_Write_Time") %></td>
			</tr>
			<tr>
				<th>Last Updated</th>
				<td><%= rset.getString("n_write_Update") %></td>
			</tr>
			<tr>
				<th>Article</th>
				<td><textarea name="n_content" class="w4 hf"><%= rset.getString("n_content") %></textarea></td>
			</tr>
			<tr>
				<th>PassWord</th>
				<td><input type="password" clss="passsword" name="n_password" size="60"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정 취소"  onclick="history.back();">
					<input type="submit" value="글 수정" >
				</td>
			</tr>
		</table>
	</form>
<%
	}
	rset.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>

