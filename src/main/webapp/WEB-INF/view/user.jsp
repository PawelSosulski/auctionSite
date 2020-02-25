<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<h1><b>${user.username}</b></h1>
<br><br>
<h2 class="title panel is-primary">User auctions</h2>

<table class="table is-bordered is-striped is-narrow is-hoverable">
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Category</th>
        <th>Actual price</th>
        <th>Bid number</th>
        <th>Time to end</th>
    </tr>
    <c:forEach items="${userAuctions}" var="auction" varStatus="stat">
        <c:url value="../auction/${auction.id}" var="auctionUrl"/>
        <tr>
            <td>${stat.count}</td>
            <td><a href="${auctionUrl}">${auction.title}</a></td>
            <td>${auction.categoryName}</td>
            <td>${auction.actualPrice}</td>
            <td>${auction.bidsNumber}</td>
            <td>
                <div id="timer-${auction.id}"></div>
            </td>
        </tr>
        <script>
            Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
        </script>
    </c:forEach>
</table>

