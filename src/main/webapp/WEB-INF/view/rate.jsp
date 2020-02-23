<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="count" value="${[5,4,3,2,1]}"/>

<div class="container">
    <div class="form-horizontal">
        <h3 class="title">Rate auction</h3>
        <div class="panel-title">Auction: ${rate.auctionTitle}</div>

        <form:form action="/rate-add" method="post" modelAttribute="rate">
            <div class="field">
                <div class="control has-icons-left">
                    <span class="select is-focused">
                        <label class="label" for="rateValue">Rate</label>
                        <select id="rateValue" name="rateValue">
                            <c:forEach items="${count}" var="value">
                                <option value="${value}">${value}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span class="icon is is-small is-left">
                        <i class="fa fa-star"></i>
                    </span>
                </div>
            </div>

            <spring:bind path="rate.rateDescription">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="label" for="desc">Description:</label><br>
                    <form:textarea cssClass="textarea is-medium is-hovered has-fixed-size" id="desc" cols="70" rows="5"
                                   path="rateDescription"/><br>
                    <form:errors path="rateDescription"/>
                </div>
            </spring:bind>

            <form:hidden path="auctionTitle"/>
            <form:hidden path="purchaseId"/>
            <form:hidden path="role"/>
            <button class="button btn-primary" type="submit">Rate!</button>
        </form:form>
    </div>
</div>