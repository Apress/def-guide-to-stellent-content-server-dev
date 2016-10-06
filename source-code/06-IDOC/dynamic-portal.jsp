<%@ page import="idcserver.*" %>
<jsp:useBean id = "serverbean" scope="page" class="idcserver.ServerBean" />
<%
	serverbean.init(request);
	String isAdmin = serverbean.evalIdcScp("UserIsAdmin");
	if (isAdmin.equals("1"))
	{
		serverbean.evalIdcScp("docLoadResourceIncludes(" +
			"'dDocName=admin_portal_includes" +
			"&RevisionSelectionMethod=Latest')");
	}
	else
	{
		serverbean.evalIdcScp("docLoadResourceIncludes(" +
			"'dDocName=user_portal_includes" +
			"&RevisionSelectionMethod=Latest')");
	}

%>
<html>
<head>
	<%= serverbean.evalResInc("std_html_head_declarations")%>
</head>

<%= serverbean.evalResInc("body_def")%>
<%= serverbean.evalIdcScp("include std_page_begin") %>

<p>Content of the portal page</p>

<%= serverbean.evalIdcScp("include std_page_end") %>
</body>
</html>