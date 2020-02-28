<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.auction.utils.enums.TransactionRole" %>

<section class="section">
    <div class="container">
        <h1 class="title is-1 page-title">My transactions</h1>

        <div class="columns">

            <div class="column">
                <div class="field">
                    <label class="label">Bought</label>
                    <c:choose>
                        <c:when test="${purchases.size()>0}">
                            <c:forEach items="${purchases}" var="purchase" varStatus="stat">
                                <c:url value="/auction/${purchase.auction.id}" var="auctionUrl"/>
                                <div class="card is-fullwidth">
                                    <header class="card-header">
                                        <p class="card-header-title"><a
                                                href="${auctionUrl}">${purchase.auction.title}</a></p>
                                        <a class="card-header-icon card-toggle">
                                            <i class="fa fa-angle-down"></i>
                                        </a>
                                    </header>
                                    <div class="card-content is-hidden">
                                        <div class="content">
                                            <div class="columns">
                                                <div class="column">
                                                    <p><b>Price:</b> ${purchase.amount}</p>
                                                    <p><b>Seller:</b> <a
                                                            href="/user/${purchase.sellerUser.username}">${purchase.sellerUser.username}</a>
                                                    </p>
                                                    <p>${purchase.sellerUser.name} ${purchase.sellerUser.lastName}<br>
                                                            ${purchase.sellerUser.street} ${purchase.sellerUser.streetNumber}<br>
                                                            ${purchase.sellerUser.city} ${purchase.sellerUser.zipCode}
                                                </div>
                                                <div class="column">

                                                    <c:if test="${purchase.transactionAssessment.sellerRating != null}">
                                                        <p><b>Your
                                                            rate:</b> ${purchase.transactionAssessment.sellerRating}</p>
                                                        <br>
                                                        <p><b>Your
                                                            opinion:</b> ${purchase.transactionAssessment.sellerNote}
                                                        </p>
                                                        <br>
                                                    </c:if>

                                                    <c:if test="${purchase.transactionAssessment.buyerRating != null}">
                                                        <p><b>Seller
                                                            rate:</b> ${purchase.transactionAssessment.buyerRating}</p>
                                                        <br>
                                                        <p><b>Seller
                                                            opinion:</b> ${purchase.transactionAssessment.buyerNote}</p>
                                                    </c:if>

                                                    <c:if test="${purchase.transactionAssessment.sellerRating == null}">
                                                        <form method="post" action="/rate">
                                                            <input type="hidden" name="role"
                                                                   value="${TransactionRole.Buyer}">
                                                            <input type="hidden" name="purchaseId"
                                                                   value="${purchase.purchaseId}">
                                                            <p class="control has-text-right">
                                                                <button class="button is-success" type="submit">
                                                                    Add rate
                                                                </button>
                                                            </p>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="field">
                                <div class="control">
                                    <p>There is nothing to show.</p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="column">
                <div class="field">
                    <label class="label">Sold</label>
                    <c:choose>
                        <c:when test="${sales.size()>0}">
                            <c:forEach items="${sales}" var="sale" varStatus="stat">
                                <c:url value="/auction/${sale.auction.id}" var="auctionUrl"/>
                                <div class="card is-fullwidth">
                                    <header class="card-header">
                                        <p class="card-header-title"><a
                                                href="${auctionUrl}">${sale.auction.title}</a></p>
                                        <a class="card-header-icon card-toggle">
                                            <i class="fa fa-angle-down"></i>
                                        </a>
                                    </header>
                                    <div class="card-content is-hidden">
                                        <div class="content">
                                            <div class="columns">
                                                <div class="column">
                                                    <p><b>Price:</b> ${sale.amount}</p>
                                                    <p><b>Buyer:</b> <a
                                                            href="/user/${sale.buyerUser.username}">${sale.buyerUser.username}</a>
                                                    </p>
                                                    <p>${sale.buyerUser.name} ${sale.buyerUser.lastName}<br>
                                                            ${sale.buyerUser.street} ${sale.buyerUser.streetNumber}<br>
                                                            ${sale.buyerUser.city} ${sale.buyerUser.zipCode}
                                                </div>
                                                <div class="column">

                                                    <c:if test="${sale.transactionAssessment.buyerRating != null}">
                                                        <p><b>Your rate:</b> ${sale.transactionAssessment.buyerRating}
                                                        </p>
                                                        <br>
                                                        <p><b>Your opinion:</b> ${sale.transactionAssessment.buyerNote}
                                                        </p>
                                                        <br>
                                                    </c:if>

                                                    <c:if test="${sale.transactionAssessment.sellerRating != null}">
                                                        <p><b>Buyer
                                                            rate:</b> ${sale.transactionAssessment.sellerRating}</p>
                                                        <br>
                                                        <p><b>Buyer
                                                            opinion:</b> ${sale.transactionAssessment.sellerNote}</p>
                                                    </c:if>

                                                    <c:if test="${sale.transactionAssessment.buyerRating == null}">
                                                        <form method="post" action="/rate">
                                                            <input type="hidden" name="role"
                                                                   value="${TransactionRole.Seller}">
                                                            <input type="hidden" name="purchaseId"
                                                                   value="${sale.purchaseId}">
                                                            <p class="control has-text-right">
                                                                <button class="button is-success" type="submit">
                                                                    Add rate
                                                                </button>
                                                            </p>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="field">
                                <div class="control">
                                    <p>There is nothing to show.</p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="/resources/js/more-information.js"></script>