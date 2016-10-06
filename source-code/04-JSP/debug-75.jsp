<%@ page errorPage="error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="idcserver.*" %>
<jsp:useBean id = "serverbean" scope="page" class="idcserver.ServerBean" />
<%
	// initialize the server bean object
	serverbean.init(request);
%>
<html>
<head>
	<title>debug page</title>
	<%= serverbean.evalResInc("std_html_head_declarations")%>
</head>

<%= serverbean.evalResInc("body_def")%>
<%= serverbean.evalResInc("std_page_begin") %>

<p>This page is designed to demonstrate how to get a debug data dump
from a content server request in a JSP. This can only be used with
a 7.5 Content Server.</p>

<xmp style="text-align:left">
<%
	serverbean.evalIdcScp("trace('#all', 'debugTrace')");
	out.println(serverbean.getLocal("debugTrace"));
%>
</xmp>

<%= serverbean.evalResInc("std_page_end") %>
</body>
</html>