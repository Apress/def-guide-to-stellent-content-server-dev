<%@ page errorPage="error.jsp" session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="idcserver.*" %>
<jsp:useBean id = "sb" scope="page" class="idcserver.ServerBean" />
<%
	sb.init(request);
	sb.parseExecuteService("IdcService=GET_SEARCH_RESULTS");
	ServerResultSet results = sb.getResultSet("SearchResults");
%>

<html>
<head>
<%
	// create a title for the page based on if the user is logged in
	String pageTitle = "Guest Search Results Page";
	if (sb.evalIdcScp("IsLoggedIn").equals("1"))
		pageTitle = "Search Results For " + sb.evalIdcScp("UserName");
	sb.putLocal("PageTitle", pageTitle);
%>
<%= sb.evalResInc("searchapi_result_html_head_declarations")%>
</head>

<%= sb.evalResInc("searchapi_result_body_def")%>
<%= sb.evalResInc("std_page_begin") %>

<h3 class=pageTitle>JSP Search Results Page</h3>

<p>Found <%=sb.getLocal("TotalRows")%> results.</p>

<%
	// determine if there are more search results, if so, show back
	// and forward buttons
	int resultCount = Integer.parseInt(sb.getLocal("ResultCount"));
	int total = Integer.parseInt(sb.getLocal("TotalRows"));

	if (resultCount < total)
	{
		// the base URL for a query
		String urlBase = "search-results.jsp?" +
			"SortOrder=" + sb.getLocal("SortOrder") +
			"&SortField=" + sb.getLocal("SortField") +
			"&ResultCount=" + sb.getLocal("ResultCount") +
			"&QueryText=" + sb.getLocal("QueryText");

		int startRow = Integer.parseInt(sb.getLocal("StartRow"));
		int endRow = Integer.parseInt(sb.getLocal("EndRow"));
		int pageNumber = Integer.parseInt(sb.getLocal("PageNumber"));
		int numPages = Integer.parseInt(sb.getLocal("NumPages"));

		if (numPages > 1)
		{
			if (pageNumber > 1)
			{
				String prevUrlSuffix = "&StartRow=" + (startRow-resultCount) +
					"&EndRow=" + (endRow-resultCount) +
					"&PageNumber=" + (pageNumber-1);

				out.print("[<a href=\"" + urlBase + prevUrlSuffix + "\">PREV</a>]");
			}
			if (pageNumber < numPages)
			{
				String nextUrlSuffix = "&StartRow=" + (startRow+resultCount) +
					"&EndRow=" + (endRow+resultCount) +
					"&PageNumber=" + (pageNumber+1);
				out.print("[<a href=\"" + urlBase + nextUrlSuffix + "\">NEXT</a>]");
			}
		}
	}

	String httpCgiPath = sb.evalIdcScp("HttpCgiPath");
	String httpWebRoot = sb.evalIdcScp("HttpWebRoot");
%>

<br><br>

<table border='1' cellpadding='0' cellspacing='3' width='540'>
<%
	for (results.first(); results.isRowPresent(); results.next())
	{
%>
	<tr>

	<td align='left'>
		<a href='<%=results.getStringValue("URL")%>'>
		<%=results.getStringValue("dDocName")%></a>
	</td>

	<td>
		<b><%=results.getStringValue("dDocTitle")%></b><br>
		Release Date: <%=results.getStringValue("dInDate")%><br>
		Author: <%=results.getStringValue("dDocAuthor")%>
	</td>

	<td align='center' width='50'>
		<a href='<%=httpCgiPath%>?IdcService=DOC_INFO&dID=<%=
			results.getStringValue("dID")%>'>
		<img src='<%=httpWebRoot%>/images/stellent/InfoIcon_sm.gif'
			border='0'>
		</a>
	</td>

	</tr>
<%
	} // end for loop
%>
</table>

<%= sb.evalResInc("std_page_end") %>

</body>
</html>
