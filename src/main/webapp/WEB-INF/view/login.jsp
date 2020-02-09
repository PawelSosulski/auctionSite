<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auction site</title>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>
<div class="container">
    <form action="/login" method='POST'>
        <table>
            <tr>
                <td>Login:</td>
                <td><input type='text' name='login' ></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name='password' /></td>
            </tr>
            <tr>
                <td><input name="submit" type="submit" value="submit" /></td>
            </tr>
        </table>
        <sec:csrfInput/>
    </form>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>