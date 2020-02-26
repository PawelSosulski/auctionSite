<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<h1><b>${user.username}</b></h1>
<br><br>
<h2>Rating: </h2>
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


<h2 class="title panel is-primary">User opinions</h2>

<table class="table is-bordered is-striped is-narrow is-hoverable">
    <tr>
        <th>auction</th>
        <th>Role</th>
        <th>Role user</th>
        <th>Opinion</th>
        <th>Rate</th>
    </tr>
    <c:choose>
        <c:when test="${purchases.size()>0}">
            <c:forEach items="${purchases}" var="purchase" varStatus="stat">
                <c:url value="/auction/${purchase.auction.id}" var="auctionUrl"/>
                <c:url value="/user/${purchase.sellerUser.username}" var="userUrl"/>
                <c:if test="${purchase.transactionAssessment.buyerNote != null}">
                    <tr>
                        <td><a href="${auctionUrl}">${purchase.auction.title}</a></td>
                        <td>Seller</td>
                        <td><a href="${userUrl}">${purchase.sellerUser.username}</a></td>
                        <td>${purchase.transactionAssessment.buyerNote}</td>
                        <td>${purchase.transactionAssessment.buyerRating}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>There is nothing to show.</td>
            </tr>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${sales.size()>0}">
            <c:forEach items="${sales}" var="sale" varStatus="stat">
                <c:url value="/auction/${sale.auction.id}" var="auctionUrl"/>
                <c:url value="/user/${sale.buyerUser.username}" var="userUrl"/>
                <c:if test="${sale.transactionAssessment.buyerNote != null}">
                    <tr>
                        <td><a href="${auctionUrl}">${sale.auction.title}</a> </td>
                        <td>Buyer</td>
                        <td><a href="${userUrl}">${sale.buyerUser.username}</a></td>
                        <td>${sale.transactionAssessment.sellerNote}</td>
                        <td>${sale.transactionAssessment.sellerRating}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>There is nothing to show.</td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
