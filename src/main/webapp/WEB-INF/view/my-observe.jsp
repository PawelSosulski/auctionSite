<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<section class="section">
    <div class="container">
        <h1 class="title is-1 page-title">Observe auctions</h1>
        <div class="columns is-centered">
            <div class="column">
                <c:choose>
                    <c:when test="${observeAuctions.size() > 0}">
                    <table class="table is-hoverable is-fullwidth">
                        <tr>
                            <th>Lp.</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Time to end</th>
                            <th>Actions</th>
                        </tr>
                        <c:forEach items="${observeAuctions}" var="auction" varStatus="stat">
                            <c:url value="/auction/${auction.id}" var="auctionUrl"/>

                            <tr>
                                <td>${stat.index+1}</td>
                                <td><a href="${auctionUrl}">${auction.title}</a></td>
                                <td><a href="${auctionUrl}">${auction.description}</a></td>
                                <td>${auction.categoryName}</td>
                                <td>${auction.buyNowPrice}</td>
                                <td>
                                    <div id="timer-${auction.id}"></div>
                                </td>
                                <td>
                                    <form method="post" action="/auction-remove">
                                        <input type="hidden" name="auctionId" value="${auction.id}">
                                        <button class="button is-success is-small" type="submit">DELETE FROM LIST
                                        </button>
                                    </form>
                                </td>
                            </tr>

                            <script>
                                Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
                            </script>
                        </c:forEach>
                    </table>
                    </c:when>
                    <c:otherwise>
                        <div class="field has-addons has-addons-centered">
                            <p class="subtitle is-5">There is no observe auctions now.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</section>



