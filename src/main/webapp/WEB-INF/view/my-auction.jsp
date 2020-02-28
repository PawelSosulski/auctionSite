<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.auction.utils.enums.AuctionStatus" %>
<script src="/resources/js/timer.js"></script>

<section class="section">
    <div class="container">
        <h1 class="title is-1 page-title">My auctions</h1>
        <div class="columns is-centered">
            <div class="column">
                <section class="hero is-light">
                    <div class="hero-foot">
                        <nav class="tabs is-boxed is-fullwidth is-large">
                            <div class="container">
                                <ul>
                                    <li class="tab is-active" onclick="openTab(event,'WebDev')"><a>ONGOING</a></li>
                                    <li class="tab" onclick="openTab(event,'WebAud')"><a>FINISHED</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </section>

                <div id="WebDev" class="content-tab">
                    <div class="field">
                        <c:choose>
                            <c:when test="${ongoing.size()>0}">
                                <table class="table is-hoverable is-fullwidth">
                                    <tr>
                                        <th>Lp.</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Actual price</th>
                                        <th>Bid number</th>
                                        <th>Time to end</th>
                                        <th>Auction type</th>
                                        <th colspan="2">Actions</th>
                                    </tr>
                                    <c:forEach items="${ongoing}" var="auction" varStatus="stat">
                                        <c:url value="auction/${auction.id}" var="auctionUrl"/>
                                        <tr>
                                            <td>${stat.count}</td>
                                            <td><a href="${auctionUrl}">${auction.title}</a></td>
                                            <td>${auction.categoryName}</td>
                                            <td>${auction.actualPrice}</td>
                                            <td>${auction.bidsNumber}</td>
                                            <td>
                                                <div id="timer-${auction.id}"></div>
                                            </td>
                                            <td>${auction.auctionType}</td>
                                            <td>
                                                <form method="post">
                                                    <input type="hidden" name="auctionId" value="${auction.id}">
                                                    <button class="button is-success is-small" name="end" type="submit">
                                                        END
                                                    </button>
                                                </form>
                                            </td>
                                            <td>
                                                <c:if test="${auction.auctionType == 'NORMAL' && isPremiumUser}">
                                                    <form method="post">
                                                        <input type="hidden" name="auctionId" value="${auction.id}">
                                                        <button class="button is-success is-small" name="promote"
                                                                type="submit">PROMOTE
                                                        </button>
                                                    </form>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <script>
                                            Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
                                        </script>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <div class="field has-addons has-addons-centered" style="margin-top: 20px;">
                                    <p class="subtitle is-5">There is no auction to show.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div id="WebAud" class="content-tab" style="display:none">
                    <div class="field">
                        <c:choose>
                            <c:when test="${finished.size()>0}">
                                <table class="table is-hoverable is-fullwidth">
                                    <tr>
                                        <th>Lp.</th>
                                        <th>Title</th>
                                        <th>Status</th>
                                        <th>Value</th>
                                        <th>Bids</th>
                                    </tr>
                                    <c:forEach items="${finished}" var="auction" varStatus="stat">
                                        <tr>
                                            <td>${stat.count}</td>
                                            <td>${auction.title}</td>
                                            <td>${auction.status}</td>
                                            <td>
                                                <c:if test="${auction.status==AuctionStatus.SOLD}">
                                                    <c:choose>
                                                        <c:when test="${auction.bidsNumber > 0}">
                                                            ${auction.actualPrice}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${auction.buyNowPrice}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${auction.status==AuctionStatus.SOLD}">
                                                    <c:choose>
                                                        <c:when test="${auction.bidsNumber == 0}">
                                                            1
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${auction.bidsNumber}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <div class="field has-addons has-addons-centered" style="margin-top: 20px;">
                                    <p class="subtitle is-5">There is no auction to show.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="/resources/js/tabs.js"></script>