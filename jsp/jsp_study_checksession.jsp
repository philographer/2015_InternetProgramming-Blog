<!-- jsp_study_checksession.jsp -->
<%@ page contentType="text/html;charset=utf-8" %>
<%
	String login_id = null;
	String login_author = null;

	if (session.getAttribute("id") == null)
	{
		// 로그인이 정상적이지 않거나 로그인 되어 있지 않거나 로그인이 해제된 상태
		%>
		<script>
			alert("로그인이 필요합니다.");
			//location.href='index.jsp';
			location.href='../html/login.jsp';
		</script>
		<%
	} else {
		// 로그인이 정상적인 상태
		//login_id = session.getAttribute("id").toString();
		//login_author = session.getAttribute("author").toString();
		//out.println(login_id + "/" + login_author);
		
	}
	
	
%>