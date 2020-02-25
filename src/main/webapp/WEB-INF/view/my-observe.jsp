<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>


<h2>Observe auctions</h2>

<div class="table-container">
    <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
        <tr>
            <th>Lp.</th>
            <th>Title</th>
            <th>Description</th>
            <th>Category</th>
            <th>Price</th>
            <th>Time to end</th>
            <th>Usuń</th>
        </tr>
        <c:forEach items="${observeAuctions}" var="auction" varStatus="stat">
            <c:url value="/auction/${auction.id}" var="auctionUrl"/>
            <tr>
                <td>${stat.index+1}</td>
                <td><a href="${auctionUrl}">${auction.title}</a></td>
                <td><a href="${auctionUrl}">${auction.description}</a></td>
                <td>${auction.categoryName}</td>
                <td>${auction.buyNowPrice}</td>
                <td><div id="timer-${auction.id}"></div></td>
                <td>Usuń z obserwowanych</td>
            </tr>

            <script>
                Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
            </script>
        </c:forEach>
    </table>
</div>

