<%@ page import="com.stellent.cis.CISApplication" %>
<%@ page import="com.stellent.context.ISCSContext" %>
<%@ page import="com.stellent.ucpmapi.active.
	search.ISCSActiveSearchAPI" %>
<%@ page import="com.stellent.ucpmapi.active.
	search.ISCSActiveSearchResponse" %>
<%
// create the CIS application object
CISApplication cisApp = CISApplication.initializeClient();

// create a user context
ISCSContext context = cisApp.getUCPMAPI()
    .getActiveAPI()._createSCSContext();
context.setUser ("user1");

// create a search API object
ISCSActiveSearchAPI searchAPI = 
    cisApp.getUCPMAPI().getActiveAPI().getSearchAPI();

// search for the first 10 documents with 'test' in the title
ISCSActiveSearchResponse scsResponse = searchAPI.search(null, 
    context, "dDocTitle <substring> `test`", 10);

// dump the response to see what is in it
//out.println("<xmp>" + scsResponse + "</xmp>");

// place the response into the page attributes so it can 
// be accessed with JSTL taglibraries
pageContext.setAttribute("scsResponse", scsResponse);
%>
<html>
<head>
<title></title>
</head>
<body>

<table border=1>
<tr>
    <td>Content ID</td>
    <td>Title</td>
    <td>Author</td>
    <td>Security Group</td>
    <td>File Name</td>
</tr>
<c:forEach var="item" items="${scsResponse.results}">
<tr>
    <td><c:out value="${item.activeContentID}"/><br>
        <fmt:formatDate value="${item.releaseDate}"
        pattern="dd/mm/yyyy, HH:mm:ss"/></td>
    <td><a href="/scscis/getfile?dID=<c:out
        value='${item.activeDocumentID}'/>">
        <c:out value="${item.title}"/>
        </a></td>
    <td><c:out value="${item.author}"/></td>
    <td><c:out value="${item.securityGroup}"/></td>
    <td><c:out value="${item.fileName}"/>
        [<c:out value="${item.format}"/>]</td>
</tr>
</c:forEach>
</table>

</body>
</html>

