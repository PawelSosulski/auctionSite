<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.auction.utils.enums.AuctionStatus" %>
<script src="/resources/js/timer.js"></script>

<h2>My auctions</h2>
<h3>Ongoing</h3>
<c:choose>
    <c:when test="${ongoing.size()>0}">
        <table border=1px>
            <tr>
                <th>Lp.</th>
                <th>Title</th>
                <th>Category</th>
                <th>Actual price</th>
                <th>Bid number</th>
                <th>Time to end</th>
                <th>Auction type</th>
                <th colspan="2">Actions</th>
            </tr>
            <c:forEach items="${ongoing}" var="auction" varStatus="stat">
                <c:url value="auction/${auction.id}" var="auctionUrl"/>
                <tr>
                    <td>${stat.count}</td>
                    <td><a href="${auctionUrl}">${auction.title}</a></td>
                    <td>${auction.categoryName}</td>
                    <td>${auction.actualPrice}</td>
                    <td>${auction.bidsNumber}</td>
                    <td>
                        <div id="timer-${auction.id}"></div>
                    </td>
                    <td>${auction.auctionType}</td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="auctionId" value="${auction.id}">
                            <input name="end" type="submit" value="END"/>
                        </form>
                    </td>
                    <td>
                        <c:if test="${auction.auctionType == 'NORMAL' && isPremiumUser}">
                            <form method="post">
                                <input type="hidden" name="auctionId" value="${auction.id}">
                                <input name="promote" type="submit" value="PROMOTE">
                            </form>
                        </c:if>
                    </td>
                </tr>
                <script>
                    Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
                </script>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <div>There is no auction to show.</div>
    </c:otherwise>
</c:choose>
<br>
<div>
    <a href="/auction-add">Add auction</a>
</div>
<h3>Finished</h3>
<c:choose>
    <c:when test="${finished.size()>0}">
        <table border="1px">
            <tr>
                <th>Lp.</th>
                <th>Title</th>
                <th>Status</th>
                <th>Value</th>
                <th>Bids</th>
            </tr>
            <c:forEach items="${finished}" var="auction" varStatus="stat">
                <tr>
                    <td>${stat.count}</td>
                    <td>${auction.title}</td>
                    <td>${auction.status}</td>
                    <td>
                        <c:if test="${auction.status==AuctionStatus.SOLD}">
                            <c:choose>
                                <c:when test="${auction.bidsNumber > 0}">
                                    ${auction.actualPrice}
                                </c:when>
                                <c:otherwise>
                                    ${auction.buyNowPrice}
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${auction.status==AuctionStatus.SOLD}">
                            <c:choose>
                                <c:when test="${auction.bidsNumber == 0}">
                                    1
                                </c:when>
                                <c:otherwise>
                                    ${auction.bidsNumber}
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <div>There is no auction to show.</div>
    </c:otherwise>
</c:choose>

