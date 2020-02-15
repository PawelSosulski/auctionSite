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
