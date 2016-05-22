	<!-- jsp_board.jsp -->
	<%@ page contentType="text/html;charset=utf-8" %>
	<%@ page import="java.sql.*" %>
	<!doctype html>
	<html>
	<head>
		<meta charset="utf-8"/>
		<link type="text/css" href="..\css\board.css" rel="stylesheet"/>
		<title>Administrator</title>
	</head>
	<body>
		<h1 align="center" class="title">
				Administrator Page
		</h1>
				<hr align="left" style="width:387px;margin-right:auto;margin-left:auto">


		<table border = "0">
				<tr>
					<th>Account</th>
					<td colspan="3"> <a href="jsp_account_view.jsp" class="name" target="_blank">Account_manager</a> </td>
				</tr>
				<tr>
					<th>Recommendations</th>
					<td colspan="3"> <a href="jsp_recommendations_view.jsp" class="name" target="_blank">Recommendations_view</a> </td>
				</tr>
				<tr>
					<th>Diary Board</th>
					<td colspan="3"> <a href="jsp_admin_diary.jsp" class="name" target="_blank">Diary Board</a> </td>
				</tr>
				<tr>
					<th>Visitor Board</th>
					<td colspan="3"> <a href="jsp_admin_visitor.jsp" class="name" target="_blank">Visitor Board</a> </td>
				</tr>
				<tr>
					<th>Nonmember</th>
					<td colspan="3"> <a href="jsp_admin_nonmember.jsp" class="name" target="_blank">Nonmember Board</a> </td>
				</tr>
		
	</table>


				 <p align="right" >Copyright 2015~now by Yoohogyun. All Rights Reserved.</p>
	              <p align="right" >- last updated 15.3.27</p>
	</body>
	</html>


<!-- 
                  <td class="menu" style="font-size:20px">
                     <a href="html\write.html" target="_blank">Write</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
-->