<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8"/>
	 <link type="text/css" href="..\css\write.css" rel="stylesheet"/>
	<script type="text/javascript" src="..\js\notice.js"></script>
	<title>response_login</title>
</head>
<body>
		<%
		if(session.getAttribute("id") != null)
			{
		session.invalidate();
		%>

 		<script type="text/javascript"> 
  		opener.location.reload(true);
  		

  		</script>
	로그아웃이 성공하셨습니다.<br/>
		<%
			}
			else
		{
		%>
			로그인이 되어있지 않습니다.<br/>
			로그아웃 할 필요 없습니다.<br/>
		<%
		}
		%>


	<br>
	<input type="button" value="닫기"  onclick="CloseMe()" align="center" >



	
</body>
</html>
