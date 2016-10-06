<%@ page import = "idcserver.*" %>
<jsp:useBean id="sb" class="idcserver.ServerBean" />

<html>
<head>
<%
	sb.init(request);
	// create a title for the page based on if the user is logged in
	String pageTitle = "Guest Search Page";
	if (sb.evalIdcScp("IsLoggedIn").equals("1"))
		pageTitle = "Search Page For " + sb.evalIdcScp("UserName");
	sb.putLocal("PageTitle", pageTitle);
%>
<%=sb.evalResInc("std_query_html_head_declarations")%>
<script language="JavaScript">
<%=sb.evalResInc("query_form_submit_script") %>
</script>
</head>

<%= sb.evalResInc("body_def")%>
<%= sb.evalResInc("std_page_begin")%>

<h3 class=pageTitle>JSP Search Page</h3>

<form name="QUERYTEXTCOMPONENTS">
<input type=hidden name="QueryText" value="">
<table>
<tr>
	<td align=right><span class=searchLabel>Title</span></td>
	<td>
		<input type="hidden" name="opSelected" 
			value="hasAsSubstring">
		<input type="text" size=30 name="dDocTitle" value="">
	</td>
</tr>
<tr>
	<td align=right><span class=searchLabel>Content ID</span></td>
	<td>
		<input type="hidden" name="opSelected" 
			value="hasAsSubstring">
		<input type="text" size=30 name="dDocName" value="">
	</td>
</tr>
	<td align=right><span class=searchLabel>Release 
		Date From</span></td>
	<td align=left>
		<input TYPE="hidden" NAME="opSelected" Value="dateGE">
		<input TYPE="text" SIZE=12 maxlength=20 NAME="dInDate" VALUE="">
		<span class=searchLabel>To</span>
		<input TYPE="hidden" NAME="opSelected" Value="dateLess">
		<input type="text" SIZE=12 maxlength=20 name="dInDate" value="">
	</td>
</tr>
<tr>
	<td align=right><span class=searchLabel>Full Text</span></td>
	<td><input type="text" name="FullTextSearch" size=30></td>
</tr>
</table>
</form>

<form name="SEARCHFORM" method="GET"  action="jsp-search-results.jsp">
<input type=hidden name="QueryText" value="">
<input type=hidden name="ResultCount" value="5">
<input type=hidden name="ftx" value="">
<table>
<tr>
	<td><span class=searchLabel>Sort By:</span></td>
	<td><select name="SortField">
		<option selected  value="dInDate">Release Date
		<option  value="dDocTitle">Title
		<option  value="Score">Score
		</select>
	</td>
	<td><select name="SortOrder">
		<option value="Asc">Ascending
		<option selected value="Desc">Descending
		</select>
	</td>
	<td>
	<input type=submit value ="Search" onClick="submitFrm(false)">
	</td>
</tr>
</table>
</form>

<%=sb.evalResInc("std_page_end") %>

</body>
</html>
