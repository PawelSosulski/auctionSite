<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <a href="/auction-add">Dodaj aukcje</a>
</div>
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
