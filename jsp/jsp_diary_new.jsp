<!-- jsp_study_new.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<jsp:include page="jsp_study_checksession.jsp" flush="true"/>
<%
	String login_author = "";
  if (session.getAttribute("author") != null)
  {
    login_author = session.getAttribute("author").toString();
  }
%>
<!DOCTYPE html>
<html>
	<head>
		<title class="title">게시판</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="../css/board.css">
	</head>
	<body>
		<h1 class="title">Write Diary board</h1>
		<form action="jsp_diary_new_submit.jsp" method="post" accept-charset="utf-8">
							<table>
							<tr>
                            <th style="width:20%">제목</th>
                            <td><input type="text" name="d_title" id="inputTitle" style="width:97%" required placeholder="게시글의 제목을 입력해 주세요"></td>
                          </tr>
                          <tr>
                            <th style="width:20%">글쓴이</th>
                            <td><input type="text" name="d_author" id="inputTitle" style="width:97%" readonly="true" value="<%= login_author %>"></td>
                          </tr>
                          <tr>
                            <th>날짜</th>
                            <td><input type="datetime-local" name="d_Eat_Time" id="inputDate" style="width:97%"> </td>
                          </tr>
                          <tr>
                          <th>위치</th>
                          <td> <input type="text" name="d_Eat_Place" id="inputLocation" style="width:97%" placeholder="어디서 먹은 음식인지 입력해 주세요" ></td>
                          </tr>
                          <tr>
                          <th>언제 </th>
                          <td><select size="1" id="inputWhen" name="d_Meal_Time" required style="width: 97%;border:outset;background-color:#E8F7F7" size="35" > 
                          <option>선택해주세요</option> <option>아침</option> <option>점심</option> <option>저녁</option> <option>간식</option>    
                          </select></td>
                          </tr>
                          <tr>
                            <th>음식분류</th>
                            <td><select size="1" id="inputClassified" name="d_Food_Class" required style="width: 97%;border:outset;background-color:#E8F7F7" size="35" > 
                            <option>선택해주세요</option> <option>밥</option> <option>면</option> <option>고기</option> <option>채소</option> <option>기타</option>    
                            </select></td>
                          </tr>
                          <tr>
                            <th>사진</th>
                            <td><input type="file" name="foodpicture" accept="image/*"></td>
                          </tr>
                          <tr>
                          <th>내용</th>
                          <td> <textarea rows="10" id="inputContent" name="d_content" cols="50" name="comment" style="background-color:#E8F7F7" placeholder="내용을 입력해 주세요"></textarea></td>
                          </tr>
                          <tr>
                            <th>비밀번호</th>
                            <td><input type="password" name="d_password"></td>
                          </tr>
                          <tr>
                          <td></td>
                          <td><input type="submit" value="Send" onclick="printData();" style="width: 40%;background-color:#80C6FC">
                          <input type="reset" value="Reset" style="width: 40%;background-color:#80C6FC"></td>
                          </tr>  
                         </table>
		</form>
	</body>
	<script type="text/javascript"></script>
</html>

