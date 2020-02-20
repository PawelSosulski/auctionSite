<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.auction.utils.enums.AuctionStatus" %>

<h2>My auctions</h2>
<h3>Ongoing</h3>
<c:choose>
    <c:when test="${ongoing.size()>0}">
        <table border=1px>
            <tr>
                <th>Lp.</th>
                <th>Title</th>
                <th>Category</th>
                <th>Actual prize</th>
                <th>Bid number</th>
                <th>Time to end</th>
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
                </tr>
                <script>
                    function Run(div) {
                        let countDown = new Date("${auction.dateEnded}").getTime();
                        let x = setInterval(function () {
                            let now = new Date().getTime();
                            let distance = countDown - now;
                            let days = Math.floor(distance / (1000 * 60 * 60 * 24));
                            let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                            let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                            let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                             if (days !== 0 ) {

                                 div.innerHTML = days + "d " + hours + "h "
                                     + minutes + "m " + seconds + "s ";
                             } else {
                                 div.innerHTML = hours + "h "
                                     + minutes + "m " + seconds + "s ";
                             }
                            if (distance < 0) {
                                clearInterval(x);
                                div.innerHTML = "ENDED";
                            }
                        }, 1000);
                    }

                    Run(document.getElementById("timer-${auction.id}"));
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
                                    ${auction.actualPrize}
                                </c:when>
                                <c:otherwise>
                                    ${auction.buyNowPrice}
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                    <td>
                        ${auction.bidsNumber}
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <div>There is no auction to show.</div>
    </c:otherwise>
</c:choose>

