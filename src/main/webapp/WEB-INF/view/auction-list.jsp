<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auction site</title>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>
<h2>Auction list:</h2>
<table border="yes">
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Description</th>
        <th>Category</th>
        <th>Buy now</th>
    </tr>
    <c:forEach items="${auctions}" var="auction" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${auction.title}</td>
            <td>${auction.description}</td>
            <td>${auction.categoryName}</td>
            <td>${auction.buyNowPrice}</td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>