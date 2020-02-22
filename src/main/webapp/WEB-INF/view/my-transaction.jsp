<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.auction.utils.enums.TransactionRole" %>

<h2>Transactions</h2>
<h3>Bought:</h3>
<c:choose>
    <c:when test="${purchases.size()>0}">
        <c:forEach items="${purchases}" var="purchase" varStatus="stat">
            <c:url value="/auction/${purchase.auction.id}" var="auctionUrl"/>
            <a href="${auctionUrl}">${purchase.auction.title}</a>
            Price: ${purchase.amount}<br>
            <table border="yes">
                <tr>
                    <th>Seller:</th>
                    <th>
                        Your rate:
                    </th>
                    <th>
                        Your opinion:
                    </th>
                </tr>
                <tr>
                    <td>
                            ${purchase.sellerUser.username}<br>
                            ${purchase.sellerUser.name} ${purchase.sellerUser.lastName}<br>
                            ${purchase.sellerUser.street} ${purchase.sellerUser.streetNumber}<br>
                            ${purchase.sellerUser.city} ${purchase.sellerUser.zipCode}<br>
                            ${purchase.sellerUser.province}
                    </td>
                    <td>
                        ${purchase.transactionAssessment.buyerRating}
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${purchase.transactionAssessment.sellerRating == null}">
                                <form method="post" action="/rate">
                                    <input type="hidden" name="role" value="${TransactionRole.Buyer}">
                                    <input type="hidden" name="purchaseId" value="${purchase.purchaseId}">
                                    <input type="submit" value="Add Rating"/>
                                </form>
                            </c:when>
                            <c:otherwise>
                                ${purchase.transactionAssessment.sellerRating}
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
            <br>
        </c:forEach>
    </c:when>
    <c:otherwise>
        There is nothing to show.
    </c:otherwise>
</c:choose>

<h3>Sold:</h3>
<c:choose>
    <c:when test="${sales.size()>0}">
        <c:forEach items="${sales}" var="sale" varStatus="stat">
            <c:url value="/auction/${sale.auction.id}" var="auctionUrl"/>
            <a href="${auctionUrl}">${sale.auction.title}</a>
            Price: ${sale.amount}<br>
            <table border="yes">
                <tr>
                    <th>Buyer:</th>
                    <th>
                        Your rate:
                    </th>
                    <th>
                        Your opinion:
                    </th>
                </tr>
                <tr>
                    <td>
                            ${sale.buyerUser.username}<br>
                            ${sale.buyerUser.name} ${sale.buyerUser.lastName}<br>
                            ${sale.buyerUser.street} ${sale.buyerUser.streetNumber}<br>
                            ${sale.buyerUser.city} ${sale.buyerUser.zipCode}<br>
                            ${sale.buyerUser.province}
                    </td>
                    <td>
                            ${sale.transactionAssessment.sellerRating}
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${sale.transactionAssessment.buyerRating == null}">
                                <form method="post" action="/rate">
                                    <input type="hidden" name="role" value="${TransactionRole.Seller}">
                                    <input type="hidden" name="purchaseId" value="${sale.purchaseId}">
                                    <input type="submit" value="Add Rating"/>
                                </form>
                            </c:when>
                            <c:otherwise>
                                ${sale.transactionAssessment.buyerRating}
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
            <br>
        </c:forEach>
    </c:when>
    <c:otherwise>
        There is nothing to show.
    </c:otherwise>
</c:choose>


