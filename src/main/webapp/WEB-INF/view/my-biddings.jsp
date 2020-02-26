<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<h2>My Biddings</h2>
<c:choose>
    <c:when test="${biddings.size()>0}">
        <table border=1px>
            <tr>
                <th>Lp.</th>
                <th>Title</th>
                <th>Category</th>
                <th>Actual prize</th>
                <th>Bid number</th>
                <th>Time to end</th>
                <th></th>
            </tr>
            <c:forEach items="${biddings}" var="bidding" varStatus="stat">
                <c:url value="auction/${bidding.auctionId}" var="auctionUrl"/>
                <tr>
                    <td>${stat.count}</td>
                    <td><a href="${auctionUrl}">${bidding.auctionTitle}</a></td>
                    <td>${bidding.categoryName}</td>
                    <td>${bidding.actualPrice}</td>
                    <td>${bidding.bidsNumber}</td>
                    <td><div id="timer-${bidding.auctionId}"></div></td>
                    <td>
                        <c:choose>
                            <c:when test="${bidding.isUserBidHighest==true}">
                                Highest offer
                            </c:when>
                            <c:otherwise>
                                -
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <script>
                    Run(document.getElementById("timer-${bidding.auctionId}"), new Date("${bidding.dateEnded}"));
                </script>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        There is no bidding auctions now.
    </c:otherwise>
</c:choose>
