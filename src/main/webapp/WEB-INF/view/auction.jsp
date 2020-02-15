<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3>${auction.title}</h3>
<div>
    Description:<br>
    ${auction.description}<br>
</div>
<div>
    Bid:<br>
    <form:form method="POST" action="/bidAuction" modelAttribute="auction">
        <%--<input type="number" name="value" value="${auction.startPrice}"/>--%>
        <c:choose>
            <c:when test="${auction.actualPrice == null}">
                <input type="number" name="value" value="${auction.startPrice}"/>
            </c:when>
            <c:otherwise>
                <input type="number" name="value" value="${auction.actualPrice}"/>
            </c:otherwise>
        </c:choose>
        <br>
        <input type="hidden" name="auctionId" value="${auction.id}"/>
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
    Time to end: <p id="timer"></p><br>

</div>

<script>
    let countDownDate = new Date().setTime(${timer});
    let x = setInterval(function() {
        let now = new Date().getTime();
        let distance = countDownDate - now;

        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.getElementById("timer").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";

        if (distance < 0) {
            clearInterval(x);
            document.getElementById("timer").innerHTML = "ENDED";
        }
    }, 1000);
</script>