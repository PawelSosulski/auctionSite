<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auction site</title>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>

<h3>Add new auction</h3>
<sf:form method="post" action="/auction-add" modelAttribute="newAuction">
    <table>
        <tr>
            <td>Title:</td>
            <td><sf:input path="title"/></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><sf:textarea cols="70" rows="15" path="description"/></td>
        </tr>
        <tr>
            <td>Start price:</td>
            <td><sf:input path="startPrice"/></td>
        </tr>
        <tr>
            <td>Buy now price:</td>
            <td><sf:input path="buyNowPrice"/></td>
        </tr>
        <tr>
            <td>Category:</td>
            <td>
                <sf:select path="categoryId">
                    <sf:options items="${categories}"/>
                </sf:select>
            </td>
        </tr>
    </table>
    <sf:button value="Add"/>
</sf:form>

<jsp:include page="fragments/footer.jsp"/>
</body>
</html>