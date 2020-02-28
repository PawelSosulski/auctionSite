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


        <h1 class="title is-1 page-title">AUCTION LIST</h1>


        <div class="columns is-desktop">
            <div class="column is-one-fifth-desktop">
                <form:form method="post" action="/auction" modelAttribute="filter">

                    <div>
                        <select name="categoryId" onmousedown="if(this.options.length>8){this.size=8;}"
                                onchange='this.size=0;'
                                onblur="this.size=0;">
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
                    <table>
                        <tr>
                            <td><form:radiobutton value="${SortOptions.priceASC}" path="sort"/> Cheapest</td>
                            <td><form:radiobutton value="${SortOptions.priceDES}" path="sort"/> Expensive</td>
                        </tr>
                        <tr>
                            <td><form:radiobutton value="${SortOptions.timeASC}" path="sort"/> Newest</td>
                            <td><form:radiobutton value="${SortOptions.timeDES}" path="sort"/> Time to end</td>
                        </tr>
                    </table>
                    <form:checkbox path="onlyBuyNow"/>Only buy now
                    <br>
                    <input type="submit" value="Filtr">
                </form:form>
                <span>
        <form:form action="/auction-clear-filter" method="post">
            <input type="submit" value="Clear">
        </form:form>
    </span>
            </div>
            <div class="column is-four-fifths-desktop">
                <table id="myTable" class="table table-striped">
                    <thead>
                    <tr>
                        <th>Lp.</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Time to end</th>
                    </tr>
                    </thead>
                    <c:choose>
                        <c:when test="${auctions.size()>0}">
                            <c:forEach items="${auctions}" var="auction" varStatus="stat">
                                <c:url value="auction/${auction.id}" var="auctionUrl"/>
                                <c:choose>
                                    <c:when test="${auction.auctionType == 'NORMAL'}">
                                        <tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr style="background-color: aquamarine">
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
        <div>
            <sec:authorize access="isAuthenticated()">
                <div>
                    <a href="/auction-add" class="button is-primary is-light is-outlined">Add auction</a>
                </div>
            </sec:authorize>
        </div>

    </div>
</section>


