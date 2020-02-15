<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <a href="/my-account">My account</a>
    <a href="my-auction">My auction</a>
</div>

<h2>My auctions:</h2>
<table border=1px>
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Description</th>
        <th>Category</th>
        <th>Price buy now</th>
    </tr>
    <c:forEach items="${myAuctions}" var="auction" varStatus="stat">
        <c:url value="auction/${auction.id}" var="auctionUrl"/>
        <tr>
            <td>${stat.index+1}</td>
            <td><a href="${auctionUrl}">${auction.title}</a></td>
            <td><a href="${auctionUrl}">${auction.description}</a></td>
            <td>${auction.categoryName}</td>
            <td>${auction.buyNowPrice}</td>
        </tr>
    </c:forEach>
</table>
