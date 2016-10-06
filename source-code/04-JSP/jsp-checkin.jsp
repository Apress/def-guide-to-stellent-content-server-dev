<%@ page import="idcserver.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id = "sb" scope="page" class="idcserver.ServerBean" />
<%
	// initialize the server bean object
	sb.init(request);
	sb.putLocal("PageTitle", "Check In");
	sb.putLocal("isNew", "1");
	sb.putLocal("MultiUpload", "false");
%>
<html>
<head>
	<%= sb.evalResInc("std_checkin_html_head_declarations")%>
</head>

<%= sb.evalResInc("body_def")%>
<%= sb.evalResInc("std_page_begin") %>

<%
	// execute a service call to load the custom metadata info, and content types
	sb.parseExecuteService("IdcService=GET_DOC_CONFIG_INFO");

	// this is the location of the current JSP
	String fileUrl = sb.getLocal("fileUrl");

	// this is the location of the confirm page to redirect to, after the
	// checkin is complete. Note that we have to pass the 'dDocName' in the
	// redirect URL so that we can access its value on the redirected page
	String redirectUrl = fileUrl.substring(0, fileUrl.lastIndexOf("/")) +
		"/jsp-checkin-confirm.jsp?dDocName=<$dDocName$>&dID=<$dID$>&dDocTitle=<$dDocTitle$>";
%>

<h3>JSP Check In</h3>

<p>This check in page gives the JSP developer total control over which
metadata fields to display, and how to format the HTML.</p>

<form name="Checkin" method="post" enctype="multipart/form-data"
	action="<%=sb.evalIdcScp("HttpCgiPath")%>">

<!-- prefilled default values... you can place other default
     values here for metadata such as 'dDocType' and 'dSecurityGroup'
     to make specialized contribution paes -->
<input type=hidden name="IdcService" value="CHECKIN_NEW">
<input type=hidden name="dDocAuthor" value="<%=sb.evalIdcScp("UserName")%>">
<input type=hidden name="dRevLabel" value="1">
<input type=hidden name="dInDate" value="<%=sb.evalIdcScp("dateCurrent()")%>">
<input type=hidden name="dDocAccount" value="">
<input type=hidden name="RedirectUrl" value="<%=redirectUrl%>">

<table>

<!-- This field is optional if auto numbering is turned on for the Stellent
     Content Server.  -->
<tr>
	<td>Content ID</td>
	<td><input type="text" name="dDocName" size=35 maxlength=30
		value="">
	</td>
</tr>
<tr>
	<td>Type</td>
	<td>
		<select name="dDocType">
<%
	ServerResultSet types = sb.getResultSet("DocTypes");
	for (types.first(); types.isRowPresent(); types.next())
	{
		out.println("<option value='" + types.getStringValue("dDocType") +
			"'>" + types.getStringValue("dDescription"));
	}
%>
		</select>
	</td>
</tr>
<tr>
	<td>Title</td>
	<td><input type="text" name="dDocTitle" size=35	maxlength=30>
	</td>
</tr>
<tr>
	<td>Security Group</td>
	<td>
		<select name="dSecurityGroup">
<%
	Vector v = sb.getOptionList("securityGroups");
	if (v != null)
	{
		Enumeration en = v.elements();
		while (en.hasMoreElements())
			out.println("<option>" + (String)en.nextElement());
	}
%>
		</select>
	</td>
</tr>
<tr>
	<td><hr></td><td><hr></td>
</tr>
<tr>
	<td>File</td>
	<td><input type="file" name="primaryFile" maxlength=250>
	</td>
</tr>
<tr>
	<td><hr></td><td><hr></td>
</tr>
<!-- custom metadata section -->
<%
	ServerResultSet metaDefs = sb.getResultSet("DocMetaDefinition");
	for (metaDefs.first(); metaDefs.isRowPresent(); metaDefs.next())
	{
		String name = metaDefs.getStringValue("dName");
		String caption = sb.evalIdcScp("lc(dCaption)");

		// this simple string will only show the metadata field and
		// its caption, giving the developer total control over the HTML
		//String simpleString = "<tr>\n<td>" + caption + "</td>\n" +
		//	"<td><input name='" + name + "'></td>\n</tr>";
		//out.println(simpleString);

		// this string will leverage internal includes to display
		// option lists, as well as hide fields that are configured
		// to be hidden
		String advancedString = sb.evalIdcScp("inc('std_meta_field_display')");
		out.println(advancedString);
	}
%>

<tr>
	<td><hr></td><td><hr></td>
</tr>
<tr>
	<td align=center colspan=2>
	<input type=submit name=submit value=" Check In ">
	<input type=reset name=reset value=" Reset ">
	</td>
</tr>
</table>
</form>

<%= sb.evalResInc("std_page_end") %>

</body>
</html>