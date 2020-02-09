<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>
<h1>Start</h1>
<sec:authorize access="isAuthenticated()">
    Helloł ${user.username}
</sec:authorize>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>