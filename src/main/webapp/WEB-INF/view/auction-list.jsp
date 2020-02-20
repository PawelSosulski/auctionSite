<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.auction.utils.enums.SortOptions" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sec:authorize access="isAuthenticated()">
    <div>
        <a href="/auction-add">Add auction</a>
    </div>
</sec:authorize>

<h2>Auction list</h2>
<div>
    <h3>Filter</h3>
    <form:form method="post" action="/auction" modelAttribute="filter">
        <fieldset>
            <form:select multiple="true" path="categoryId">
                <form:options items="${categories}"/>
            </form:select>
            <table>
                <tr>
                    <td><form:radiobutton value="${SortOptions.priceASC}" path="sort"/> Cheapest</td>
                    <td><form:radiobutton value="${SortOptions.priceDES}" path="sort"/> Expensive</td>
                </tr>
                <tr>
                    <td><form:radiobutton value="${SortOptions.timeASC}" path="sort"/> Newest</td>
                    <td><form:radiobutton value="${SortOptions.priceDES}" path="sort"/> Time to end</td>
                </tr>
            </table>
            <form:checkbox path="onlyBuyNow"/>Only buy now
            <br>
            <input type="submit" value="Filtr">
        </fieldset>
    </form:form>
    <span>
        <form:form action="/auction-clear-filter" method="post">
            <input type="submit" value="Clear">
        </form:form>
    </span>
</div>
<br>
<c:choose>
    <c:when test="${auctions.size()>0}">
        <table border="yes">
            <tr>
                <th>Lp.</th>
                <th>Title</th>
                <th>Category</th>
                <th></th>
                <th>Time to end</th>
            </tr>
            <c:forEach items="${auctions}" var="auction" varStatus="stat">
                <c:url value="auction/${auction.id}" var="auctionUrl"/>
                <tr>
                    <td>${stat.index+1}</td>
                    <td><a href="${auctionUrl}">${auction.title}</a></td>
                    <td>${auction.categoryName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${auction.bidsNumber>0}">
                                Current price: ${auction.actualPrice}
                            </c:when>
                            <c:otherwise>
                                Buy now: ${auction.buyNowPrice}
                            </c:otherwise>
                        </c:choose>
                    </td>
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
                            if (days !== 0) {
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
        <div>There is nothing to show.</div>
    </c:otherwise>
</c:choose>


