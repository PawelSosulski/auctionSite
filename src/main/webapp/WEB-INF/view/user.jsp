<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<section class="section">
    <div class="container">
        <div class="columns is-centered">
            <div class="column is-two-thirds">
                <div class="field is-grouped has-addons has-addons-centered">
                    <div class="control is-vertical-center"><h3 class="title is-3">${user.username}</h3></div>
                    <div class="control">
                        <c:if test="${avatarId!=0}">
                            <figure class="image">
                                <img class="image is-rounded"
                                     style="image-orientation: from-image;width: 100px;object-fit: cover"
                                     src="/my-account/img/${avatarId}" alt="Avatar">
                            </figure>
                        </c:if>
                    </div>
                </div>

                <div class="field has-addons has-addons-centered">
                    <div class="control">
                        <p class="subtitle is-5">Rating: ${averageRates.averageRate} from ${averageRates.numberOfRates}
                            opinions</p>
                    </div>
                </div>

                <div style="margin-top: 60px" class="field">
                    <article class="panel is-success">
                        <p class="panel-heading">User auctions</p>
                        <table class="table is-hoverable is-fullwidth">
                            <tr>
                                <th>Lp.</th>
                                <th>Title</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Bid number</th>
                                <th>Time left</th>
                            </tr>
                            <c:forEach items="${userAuctions}" var="auction" varStatus="stat">
                                <c:url value="../auction/${auction.id}" var="auctionUrl"/>
                                <tr>
                                    <td>${stat.count}</td>
                                    <td><a href="${auctionUrl}">${auction.title}</a></td>
                                    <td>${auction.categoryName}</td>
                                    <td>${auction.actualPrice}</td>
                                    <td>${auction.bidsNumber}</td>
                                    <td>
                                        <div id="timer-p-${auction.id}"></div>
                                    </td>

                                    <script>
                                        Run(document.getElementById("timer-p-${auction.id}"), new Date("${auction.dateEnded}"));
                                    </script>
                                </tr>
                            </c:forEach>
                        </table>
                    </article>
                </div>

                <div style="margin-top: 60px" class="field">
                    <article class="panel is-success">
                        <p class="panel-heading">User opinions</p>
                        <table class="table is-hoverable is-fullwidth">
                            <tr>
                                <th>Auction</th>
                                <th>Role</th>
                                <th>Role user</th>
                                <th>Opinion</th>
                                <th>Rate</th>
                            </tr>
                            <c:if test="${purchases.size()>0}">
                                <c:forEach items="${purchases}" var="purchase" varStatus="stat">
                                    <c:url value="/auction/${purchase.auction.id}" var="auctionUrl"/>
                                    <c:url value="/user/${purchase.sellerUser.username}" var="userUrl"/>
                                    <c:if test="${purchase.transactionAssessment.buyerRating != null}">
                                        <tr>
                                            <td><a href="${auctionUrl}">${purchase.auction.title}</a></td>
                                            <td>Seller</td>
                                            <td><a href="${userUrl}">${purchase.sellerUser.username}</a></td>
                                            <td>${purchase.transactionAssessment.buyerNote}</td>
                                            <td>${purchase.transactionAssessment.buyerRating}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>

                            <c:if test="${sales.size()>0}">
                                <c:forEach items="${sales}" var="sale" varStatus="stat">
                                    <c:url value="/auction/${sale.auction.id}" var="auctionUrl"/>
                                    <c:url value="/user/${sale.buyerUser.username}" var="userUrl"/>
                                    <c:if test="${sale.transactionAssessment.sellerRating != null}">
                                        <tr>
                                            <td><a href="${auctionUrl}">${sale.auction.title}</a></td>
                                            <td>Buyer</td>
                                            <td><a href="${userUrl}">${sale.buyerUser.username}</a></td>
                                            <td>${sale.transactionAssessment.sellerNote}</td>
                                            <td>${sale.transactionAssessment.sellerRating}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </table>
                    </article>
                </div>
            </div>
        </div>
    </div>
</section>