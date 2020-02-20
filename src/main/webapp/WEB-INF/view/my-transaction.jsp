<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>Transactions</h2>

<c:forEach items="${transactions}" var="transaction" varStatus="stat">
    <c:url value="/auction/${transaction.auction.id}" var="auctionUrl"/>
    <a href="${auctionUrl}">${transaction.auction.title}</a>
    ${transaction.auction.categoryName}<br>
    Price: ${transaction.amount}<br>
    <table border="yes">
        <tr>
            <th>Seller:</th>
            <th>Buyer:</th>
        </tr>
        <tr>
            <td>
                    ${transaction.sellerUser.username}<br>
                    ${transaction.sellerUser.name} ${transaction.sellerUser.lastName}<br>
                    ${transaction.sellerUser.street} ${transaction.sellerUser.streetNumber}<br>
                    ${transaction.sellerUser.city} ${transaction.sellerUser.zipCode}<br>
                    ${transaction.sellerUser.province}
            </td>
            <td>
                    ${transaction.buyerUser.username}<br>
                    ${transaction.buyerUser.name} ${transaction.buyerUser.lastName}<br>
                    ${transaction.buyerUser.street} ${transaction.buyerUser.streetNumber}<br>
                    ${transaction.buyerUser.city} ${transaction.buyerUser.zipCode}<br>
                    ${transaction.buyerUser.province}
            </td>
        </tr>
    </table>
    <br>
</c:forEach>

