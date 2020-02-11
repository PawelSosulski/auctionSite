<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auction Site</title>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>

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
</body>
</html>