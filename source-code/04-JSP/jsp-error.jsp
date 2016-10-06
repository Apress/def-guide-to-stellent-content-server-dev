<%@ page isErrorPage="true"%>
<%@ page import = "java.io.*"%>
<%
	StringWriter sw = new StringWriter();
	PrintWriter pw = new PrintWriter(sw);
	exception.printStackTrace(pw);
%>

<html>
<head>
<title>JSP Error</title>
</head>
<body>

<h1>Error Generated when processing Jsp File</h1>

<xmp>
<%=sw.toString()%>
</xmp>

</body>
</html>
