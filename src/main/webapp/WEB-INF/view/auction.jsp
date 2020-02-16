<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3>${auction.title}</h3>
<div>
    Description:<br>
    ${auction.description}<br>
</div>
<div>
    <c:choose>
        <c:when test="${auction.actualPrice == null}">
            Start price:
            ${auction.startPrice}<br>
        </c:when>
        <c:otherwise>
            Acutal price:
            ${auction.actualPrice}<br>
        </c:otherwise>
    </c:choose>
</div>
<div>
    Bid:<br>
    <form:form method="POST" action="/bidAuction" modelAttribute="bid">
        <div><form:errors path="value"/></div>
        <c:choose>
            <c:when test="${auction.actualPrice == null}">
                <form:input path="value" type="number" value="${auction.startPrice}"/>
            </c:when>
            <c:otherwise>
                <form:input path="value" type="number" value="${auction.actualPrice+1}"/>
            </c:otherwise>
        </c:choose>
        <br>
        <form:hidden path="auctionId"/>
        <input type="submit" value="Bid"/>
    </form:form>
    <br>
</div>
<c:if test="${auction.actualPrice==null}">
    <div>
        Buy now:<br>
        <form:form method="POST" action="/buyAuction" modelAttribute="auction">
            <input type="submit" value="${auction.buyNowPrice}"/>
            <input type="hidden" name="auctionId" value="${auction.id}"/>
        </form:form>
    </div>
</c:if>
<div>
    Seller:<br>
    ${seller.username}<br>
</div>
<div>
    Category:<br>
    ${category.name}<br>
</div>
<div>
    Time to end: <p id="timer-${auction.id}"></p><br>

</div>
<sec:authorize access="isAuthenticated()">
    <div>
        <form:form action="/auction/observe-auction" method="post" modelAttribute="observe">
            <c:choose>
                <c:when test="${observe.isObserved}">
                    <input type="submit" value="Usuń z obserwowanych"/>
                </c:when>
                <c:otherwise>
                    <input type="submit" value="Dodaj do obserwowanych"/>
                </c:otherwise>
            </c:choose>
            <form:hidden path="isObserved"/>
            <form:hidden path="auctionId"/>
        </form:form>
    </div>
</sec:authorize>


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

            div.innerHTML = days + "d " + hours + "h "
                + minutes + "m " + seconds + "s ";

            if (distance < 0) {
                clearInterval(x);
                div.innerHTML = "ENDED";
            }
        }, 1000);
    }
    Run(document.getElementById("timer-${auction.id}"));
</script>