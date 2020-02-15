<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3>${auction.title}</h3>
<div>
    Description:<br>
    ${auction.description}
</div>
<div>
    Bid:<br>
    ${auction.startPrice}
</div>
<div>
    Buy now:<br>
    <form:form method="POST" action="/buyAuction" modelAttribute="auction">
        <input type="submit" value="Buy now: ${auction.buyNowPrice}"/>
        <input type="hidden" name="auctionId" value="${auction.id}"/>
    </form:form>
</div>
<div>
    Seller:<br>
    ${seller.username}
</div>
<div>
    Category:<br>
    ${category.name}
</div>
<jsp:include page="fragments/footer.jsp"/>
