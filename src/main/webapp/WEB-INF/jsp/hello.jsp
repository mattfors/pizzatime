<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="actionBean" scope="request" type="org.fors.action.HelloActionBean"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pizza Time Running</title>
</head>
<body>
<h1>Pizza Time Running</h1>
<p>SQL Version: ${actionBean.sqlVersion}</p>
<p>Java Version: ${actionBean.javaVersion}</p>
<p>Server Version: ${actionBean.serverVersion}</p>
<p>Timestamp: <%= new java.util.Date() %></p>
<ul>
    <c:forEach var="schema" items="${actionBean.schemas}">
        <li>${schema}</li>
    </c:forEach>
</ul>
</body>
</html>