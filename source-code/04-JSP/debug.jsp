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
from a content server request in a JSP. This can be used on any
version of the content server.</p>

<xmp style="text-align:left">
Request:
++++++++++++++++
<%
	Properties requestEnv = serverbean.getEnvironment();
	out.print(requestEnv.toString().replace(',', '\n'));
%>

Response:
++++++++++++++++

LocalData:
<%
	Properties localData = serverbean.getLocalData();
	out.print(localData.toString().replace(',', '\n'));

	out.print("\n\n\n");

	Enumeration e = serverbean.getResultSetList();
	while(e.hasMoreElements())
	{
		String name = (String)e.nextElement();
		ServerResultSet srs = serverbean.getResultSet(name);
		out.print("\n\n" + name + ":\n");

		int numFields = srs.getNumFields();
		for (srs.first(); srs.isRowPresent(); srs.next())
		{
			out.print("------\n");
			for (int i=0; i<numFields; i++)
			{
				out.print(srs.getFieldName(i) + ": " +
					srs.getStringValue(i) + "\n");
			}
		}
	}
%>
</xmp>

<%= serverbean.evalResInc("std_page_end") %>
</body>
</html>