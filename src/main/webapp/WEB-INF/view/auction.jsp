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
    ${auction.buyNowPrice}
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
