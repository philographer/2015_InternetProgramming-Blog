<!-- jsp_study_login_out.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%
	session.setAttribute("id", null);
	session.setAttribute("author", null);
%>
<script>
	alert("로그아웃 되었습니다.");
	//location.href='index.jsp';
	location.href='../html/login.jsp';
</script>
