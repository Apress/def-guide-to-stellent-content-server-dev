<%@ page import="idcserver.*" %>
<jsp:useBean id = "sb" scope="page" class="idcserver.ServerBean" />
<%
	sb.init(request);
	sb.putLocal("PageTitle", "Check In Confirmation");
%>
<html>
<head>
	<%= sb.evalResInc("std_html_head_declarations")%>
</head>
<%= sb.evalResInc("body_def")%>
<%= sb.evalResInc("std_page_begin") %>

<h3>Check In Confirmation</h3>

<p>Successfully checked in content item:
<a href="<%=sb.evalIdcScp("HttpCgiPath")
	%>?IdcService=DOC_INFO&dID=<%=sb.getLocal("dID")%>">
<%=sb.getLocal("dDocName")%></a></p>

<%= sb.evalResInc("std_page_end") %>

</body>
</html>