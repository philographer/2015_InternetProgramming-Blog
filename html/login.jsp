<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>12121518 유호균</title>
		<script type="text/javascript" src="..\js\login.js"></script>
		<meta charset="utf-8">
		<link type="text/css" href="..\css\account.css" rel="stylesheet"/>

	</head>
		<body onload="checkCookie()">
		<form action="..\jsp\jsp_response_login_result.jsp" method="get">
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<h1 align="center" class="title">
				Account Login
		</h1>
				<hr align="left" style="width:387px;margin-right:auto;margin-left:auto"> 

				<% 
					if (session.getAttribute("id") != null)
						{
					%>
						로그인이 이미 되어있습니다.<br/>
						다른 아이디로 로그인하시려면 로그아웃 해주세요.<br/>
						<br/>
						<br/>
					<input type="button" value="닫기"  onclick="javascript:CloseMe()" align="center" >
						<%
					}
					else
						{
				%>
				<table border="0" style="margin-left: auto; margin-right: auto;">
					<tr>
					</tr>
					<tr>
						<td>ID</td>
						<td><input type="text" name="Ids" id="idInput"required autofocus placeholder="ID를 입력해주세요(5자이상 20자이하)" size="35" maxlength="20"  style="width: 97%;background-color:#FFE0FF;" onkeydown="chkValid(this)" onchange="chkValid(this);" onfocusout="chkValid(this);"> <br/></td>
						
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" name="Pws" id="pwInput"  required placeholder="PW를 입력해주세요(6자이상 20자이하)" size="35" maxlength="20" style="width: 97%;background-color:#FFE0FF;" onkeydown="chkValid(this);" onchange="chkValid(this);" onfocusout="chkValid(this);"><br/></td>
						
					</tr>
					<tr>
						<td style="visibility: hidden;"></td>
						<td><input id="saveid" type="checkbox" onClick="confirmSave(this)">ID 기억하기</td>
					<tr>
						<td style="visibility: hidden;"></td>
						<td><input type="submit" id="sendid" value="Send" onclick="saveId()" style="width: 47%;background-color:#80C6FC;">
						 	<input type="reset" value="Reset" style="width: 47%;background-color:#80C6FC"></td>
						
					</tr>
				</table>

			<table border="3" id="outputPrintTable" style="width:0px; height:0px; margin-left:auto; margin-right:auto; display:none"
			 >
			<tr>
			<td>
			<div id="outputId"></div>
			<div id="outputPw"></div>
			<div id="outputNickname"></div>
			<div id="outputAddress"></div>
			<div id="outputBirthday"></div>
			<div id="outputTelephone"></div>
			<div id="outputLikeRice"></div>
			<div id="outputLikechicken"></div>

			<div id="outputEatout"></div>
			<div id="outputLikemostfood"></div>
			</td>
			</tr>
			</table>
			<%
		}
		%>
			
					<footer>
   						<p align="right">Copyright 2015~now by Yoohogyun. All Rights Reserved.</p>
   						<p align="right">- last updated 15.4.29</p>
   					</footer>

		</form>
		</body>

	</html>


