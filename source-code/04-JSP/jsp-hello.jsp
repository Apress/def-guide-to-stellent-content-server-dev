<%@ page import = "idcserver.*" %>
<jsp:useBean id="sb" class="idcserver.ServerBean" />
<%
	sb.init(request);
	String user = sb.evalIdcScp("UserName");
%>
<html>
<head>
<title>Hello</title>
<%= sb.evalResInc("std_html_head_declarations")%>
</head>
<%= sb.evalResInc("body_def")%>
<%= sb.evalResInc("std_page_begin")%>

<h1>Hello <%=user%></h1>

<%=sb.evalResInc("std_page_end") %>
</body>
</html>

