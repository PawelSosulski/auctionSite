<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<section class="section">
    <div class="container">
        <div class="columns">
            <div class="column">
                <div class="field is-grouped">
                    <div class="control">
                        <h2 class="title is-2">${auction.title}</h2>
                    </div>
                    <c:if test="${auction.status == 'PENDING'}">
                        <sec:authorize access="isAuthenticated()">

                            <form:form action="/auction/observe-auction" method="post" modelAttribute="observe">
                                <c:choose>
                                    <c:when test="${observe.isObserved}">
                                        <div class="field">
                                            <div class="control">
                                                <button type="submit" class="button is-link is-danger">REMOVE FROM
                                                    FAVORITE
                                                </button>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="field">
                                            <div class="control">
                                                <button type="submit" class="button is-link is-success">ADD TO
                                                    FAVORITE
                                                </button>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <form:hidden path="isObserved"/>
                                <form:hidden path="auctionId"/>
                            </form:form>

                        </sec:authorize>
                    </c:if>
                </div>

                <div class="field">
                    <label class="label">Description</label>
                    <div class="control">
                        <div style="height: 200px">${auction.description}<br></div>
                    </div>
                </div>
                <div class="field">
                    <label class="label">Seller</label>
                    <div class="control">
                        <div><a href="/user/${seller.username}">${seller.username}</a></div>
                    </div>
                </div>
                <div class="field">
                    <label class="label">Category</label>
                    <div class="control">
                        <div>${category.parentName} > ${category.name}<br></div>
                    </div>
                </div>
            </div>

            <c:if test="${auction.status == 'PENDING'}">
                <div class="column">
                    <c:choose>
                        <c:when test="${auction.actualPrice == null}">
                            <h4 class="title is-4">Start price: ${auction.startPrice}</h4>
                        </c:when>
                        <c:otherwise>
                            <h4 class="title is-4">Actual price: ${auction.actualPrice}</h4>
                        </c:otherwise>
                    </c:choose>

                    <form:form method="POST" action="/bidAuction" modelAttribute="bid">
                        <c:choose>
                            <c:when test="${auction.bidsNumber==0}">
                                <c:choose>
                                    <c:when test="${user.username != seller.username}">
                                        <div class="control">
                                            <article class="message is-success">
                                                <div class="message-header"><p>BID</p></div>
                                                <div class="message-body">
                                                    <form:input cssClass="input" path="value" type="number"
                                                                value="${auction.actualPrice}" style="width: auto;"/>
                                                    <button type="submit" class="button is-link is-success">MAKE BID
                                                    </button>
                                                </div>
                                            </article>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="control">
                                            <article class="message is-danger">
                                                <div class="message-header"><p>YOU CAN'T MAKE BID YOUR AUCTION</p></div>
                                                <div class="message-body">
                                                    <form:input cssClass="input" path="value" type="number"
                                                                value="${auction.actualPrice}"
                                                                readonly="true"
                                                                style="color: Grey; opacity: 1; width: auto;"/>
                                                    <button type="submit" class="button is-link is-danger" disabled>MAKE
                                                        BID
                                                    </button>
                                                </div>
                                            </article>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>


                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${user.username != seller.username}">
                                        <div class="control">
                                            <article class="message is-success">
                                                <div class="message-header"><p>BID</p></div>
                                                <div class="message-body">
                                                    <form:input cssClass="input" path="value" type="number"
                                                                value="${auction.actualPrice + 1}"
                                                                style="width: auto;"/>
                                                    <button type="submit" class="button is-link is-success">MAKE BID
                                                    </button>
                                                </div>
                                            </article>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="control">
                                            <article class="message is-danger">
                                                <div class="message-header"><p>YOU CAN'T MAKE BID YOUR AUCTION</p></div>
                                                <div class="message-body">
                                                    <form:input cssClass="input" path="value" type="number"
                                                                value="${auction.actualPrice + 1}"
                                                                readonly="true"
                                                                style="color: Grey; opacity: 1; width: auto;"/>
                                                    <button type="submit" class="button is-link is-danger" disabled>MAKE
                                                        BID
                                                    </button>
                                                </div>
                                            </article>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                        <form:hidden path="auctionId"/>
                    </form:form>

                    <c:if test="${auction.bidsNumber==0}">
                        <form:form method="POST" action="/buyAuction" modelAttribute="auction">
                            <c:if test="${user.username != seller.username}">
                                <div class="field buy-now">
                                    <div class="control">
                                        <article class="message is-success">
                                            <div class="message-header"><p>BUY NOW PRICE: ${auction.buyNowPrice}</p>
                                            </div>
                                            <div class="message-body">
                                                <button type="submit" class="button is-link is-success">BUY NOW
                                                </button>
                                            </div>
                                        </article>
                                    </div>
                                </div>
                            </c:if>
                            <input type="hidden" name="auctionId" value="${auction.id}"/>
                        </form:form>
                    </c:if>

                    <div class="field">
                        <label class="label">Time to end</label>
                        <div class="control">
                            <div id="timer-${auction.id}"></div>
                            <script>
                                Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
                            </script>
                        </div>
                    </div>
                </div>
            </c:if>


            <c:if test="${auction.status != 'PENDING'}">
                <div class="column">
                    <c:choose>
                        <c:when test="${auction.status == 'SOLD'}">
                            <div class="field">
                                <div class="control">
                                    <div class="notification is-danger">
                                        <p>Auction ended.</p>
                                    </div>
                                </div>
                            </div>

                            <h4 class="title is-4">Selling price: ${auction.actualPrice}</h4>

                            <c:choose>
                                <c:when test="${auction.bidsNumber == 0}">
                                    <p class="subtitle is-4">Purchase offers ${auction.bidsNumber + 1}</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="subtitle is-4">Purchase offers ${auction.bidsNumber}</p>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <div class="field">
                                <div class="control">
                                    <div class="notification is-danger">
                                        <p>Auction ended.</p>
                                    </div>
                                </div>
                            </div>

                            <h4 class="title is-4">Price: ${auction.actualPrice}</h4>
                            <p class="subtitle is-4">No buy offers</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>
        </div>
    </div>
</section>