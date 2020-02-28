<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.auction.utils.enums.SortOptions" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<section class="section">
    <div class="container">
        <h1 class="title is-1 page-title">Auction list</h1>
        <div class="columns">

            <div class="column is-one-fifth-desktop">

                <label class="label">Filter by</label>
                <div class="field has-addons has-addons-centered">
                    <form:form method="post" action="/auction" modelAttribute="filter">
                        <div class="control" style="margin-top: 20px;">
                            <div class="select">
                                <select name="categoryId">
                                    <option hidden value="0">-- Select categories --</option>
                                    <option value="0">-- All categories --</option>
                                    <c:forEach items="${mainCategories}" var="category">
                                        <optgroup label="${category.name}">
                                            <c:forEach items="${categories}" var="subCategory">
                                                <c:if test="${category.id == subCategory.parentId}">
                                                    <option value="${subCategory.id}">${subCategory.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </optgroup>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="control" style="margin-top: 20px;">
                            <label class="radio">
                                <form:radiobutton value="${SortOptions.priceASC}" path="sort"/> Cheapest
                            </label><br>
                            <label class="radio">
                                <form:radiobutton value="${SortOptions.priceDES}" path="sort"/> Expensive
                            </label><br>
                            <label class="radio">
                                <form:radiobutton value="${SortOptions.timeASC}" path="sort"/> Newest
                            </label><br>
                            <label class="radio">
                                <form:radiobutton value="${SortOptions.timeDES}" path="sort"/> Time to end
                            </label>
                        </div>

                        <div class="control" style="margin-top: 20px;">
                            <div class="checkbox">
                                <form:checkbox path="onlyBuyNow"/><span style="margin-left: 5px;">Only buy now</span>
                            </div>
                        </div>

                        <div style="margin-top: 20px;" class="field is-grouped">
                            <div class="control"><button class="button is-success" type="submit">Apply</button></div>
                            <div class="control">
                                <form action="/auction-clear-filter" method="POST">
                                    <button class="button is-success" type="submit">Clear</button>
                                </form>
                            </div>
                        </div>

                    </form:form>
                </div>
            </div>

            <div class="column is-four-fifths-desktop">
                <table class="table is-hoverable is-fullwidth">
                    <tr>
                        <th>Lp.</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Time to end</th>
                    </tr>
                    <c:choose>
                        <c:when test="${auctions.size()>0}">
                            <c:forEach items="${auctions}" var="auction" varStatus="stat">
                                <c:url value="auction/${auction.id}" var="auctionUrl"/>
                                <c:choose>
                                    <c:when test="${auction.auctionType == 'NORMAL'}">
                                        <tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr style="background-color: #48c774">
                                    </c:otherwise>
                                </c:choose>

                                <td>${stat.index+1}</td>
                                <td><a href="${auctionUrl}">${auction.title}</a></td>
                                <td>${auction.categoryName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${auction.bidsNumber>0}">
                                            Current price: ${auction.actualPrice}
                                        </c:when>
                                        <c:otherwise>
                                            Buy now: ${auction.buyNowPrice}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div id="timer-${auction.id}"></div>
                                </td>
                                </tr>
                                <script>
                                    Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
                                </script>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>
    </div>
</section>


