<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/timer.js"></script>

<h3>${auction.title}</h3>
<div>
    Description:<br>
    ${auction.description}<br>
</div>

<div>
<c:choose>
    <c:when test="${auction.status == 'PENDING'}">
        <div>
            <c:choose>
                <c:when test="${auction.actualPrice == null}">
                    Start price:
                    ${auction.startPrice}<br>
                </c:when>
                <c:otherwise>
                    Acutal price:
                    ${auction.actualPrice}<br>
                </c:otherwise>
            </c:choose>
        </div>

        Bid:<br>
        <form:form method="POST" action="/bidAuction" modelAttribute="bid">
            <div><form:errors path="value"/></div>

            <c:choose>
                <c:when test="${auction.bidsNumber==0}">
                    <c:choose>
                        <c:when test="${user.username != seller.username}">
                            <form:input path="value" type="number" value="${auction.actualPrice}"/>
                        </c:when>
                        <c:otherwise>
                            <form:input path="value" type="number" value="${auction.actualPrice}" readonly="true"
                                        style="color: Grey; opacity: 1;"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${user.username != seller.username}">
                            <form:input path="value" type="number" value="${auction.actualPrice+1}"/>
                        </c:when>
                        <c:otherwise>
                            <form:input path="value" type="number" value="${auction.actualPrice+1}" readonly="true"
                                        style="color: Grey; opacity: 1;"/>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
            <br>
            <form:hidden path="auctionId"/>
            <c:choose>
                <c:when test="${user.username != seller.username}">
                    <input type="submit" value="Bid"/>
                </c:when>
                <c:otherwise>
                    <input type="submit" value="Bid" disabled/>
                    <p style="color: red; font-weight: bold">You can't bid your auction</p>
                </c:otherwise>
            </c:choose>
        </form:form>
        <br>
        </div>

        <c:if test="${auction.bidsNumber==0}">
            <div>
                Buy now:<br>
                <form:form method="POST" action="/buyAuction" modelAttribute="auction">
                    <c:choose>
                        <c:when test="${user.username != seller.username}">
                            <input type="submit" value="${auction.buyNowPrice}"/>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="${auction.buyNowPrice}" disabled/>
                            <p style="color: red; font-weight: bold">You can't buy your auction</p>
                        </c:otherwise>
                    </c:choose>
                    <input type="hidden" name="auctionId" value="${auction.id}"/>
                </form:form>
            </div>
        </c:if>
    </c:when>
    <c:when test="${auction.status == 'SOLD'}">
        <p style="font-weight: bold">Selling price: ${auction.actualPrice}</p>

        <c:choose>
            <c:when test="${auction.bidsNumber == 0}">
                <p style="font-weight: bold">Purchase offers: ${auction.bidsNumber + 1}</p>
            </c:when>
            <c:otherwise>
                <p style="font-weight: bold">Purchase offers: ${auction.bidsNumber}</p>
            </c:otherwise>
        </c:choose>

        <p style="color: red; font-weight: bold">Auction ended!</p>
    </c:when>
    <c:otherwise>
        <p style="font-weight: bold">Price: ${auction.actualPrice}</p>
        <p style="font-weight: bold">No buy offers</p>
        <p style="color: red; font-weight: bold">Auction ended!</p>
    </c:otherwise>
</c:choose>

<div>
    Seller:<br>
    <a href="/user/${seller.username}">${seller.username}</a><br>
</div>
<div>
    Category:<br>
    ${category.parentName} > ${category.name}<br>
</div>
<c:choose>
    <c:when test="${auction.status == 'PENDING'}">
        <div>
            Time to end:
            <div id="timer-${auction.id}"></div>
            
            <script>
                Run(document.getElementById("timer-${auction.id}"), new Date("${auction.dateEnded}"));
            </script>
            <br>
        </div>

        <sec:authorize access="isAuthenticated()">
            <div>
                <form:form action="/auction/observe-auction" method="post" modelAttribute="observe">
                    <c:choose>
                        <c:when test="${observe.isObserved}">
                            <input type="submit" value="Usuń z obserwowanych"/>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Dodaj do obserwowanych"/>
                        </c:otherwise>
                    </c:choose>
                    <form:hidden path="isObserved"/>
                    <form:hidden path="auctionId"/>
                </form:form>
            </div>
        </sec:authorize>
    </c:when>
</c:choose>




