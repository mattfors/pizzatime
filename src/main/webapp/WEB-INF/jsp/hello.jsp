<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://stripes.sourceforge.net/stripes.tld" prefix="stripes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello</title>
</head>
<body>
    <h1>Hello</h1>
    <p>Java Version: ${actionBean.javaVersion}</p>
    <p>Server Version: ${actionBean.serverVersion}</p>
    <p>SQL Version: ${actionBean.sqlVersion}</p>

    <h2>Tables and Columns</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Table Name</th>
                <th>Column Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tableColumn" items="${actionBean.tablesAndColumns}">
                <tr>
                    <td>${tableColumn.TABLE_NAME}</td>
                    <td>${tableColumn.COLUMN_NAME}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>