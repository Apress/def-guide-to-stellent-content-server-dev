<%@ page import="idcserver.*" %>
<jsp:useBean id="sb" scope="page" class="idcserver.ServerBean" />
<%
	sb.init(request);
	String str = "IdcService=GET_SEARCH_RESULTS" +
		"&SearchEngineName=DATABASE";
	String queryText = sb.getLocal("QueryText");
	if (queryText == null)
		queryText = "dDocTitle LIKE '%test%'";
	str = str + "&QueryText=" + queryText;
	sb.parseExecuteService(str);
	ServerResultSet results = sb.getResultSet("SearchResults");
%>
<html>
<head>
<title>Search</title>
</head>
<body>

<h3>Test Documents</h3>

<%
	for (results.first(); results.isRowPresent(); results.next())
	{
		String url = results.getStringValue("URL");
		String title = results.getStringValue("dDocTitle");
		out.println("<li><a href='" + url + "'>" + title + "</a>");
	}
%>

</body>
</html>
