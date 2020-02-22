<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="count" value="${[5,4,3,2,1]}"/>

<div class="container">
    <div class="form-horizontal">
        <h3 class="title">Rate auction</h3>
        <div class="panel-title">Auction: ${rate.auctionTitle}</div>

        <form:form action="/rate-add" method="post" modelAttribute="rate">
            <spring:bind path="rateValue">
                <div class="field">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="rateValue">Rate</label><br>
                        <div class="select is-medium is-rounded has-icons-left">
                            <form:select cssClass="is-focused" path="rateValue">
                                <form:options items="${count}"/>
                            </form:select><br>
                            <div class="icon is-small is-left">
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                        <form:errors id="rateValue" path="rateValue"/>
                    </div>
                </div>
            </spring:bind>

            <spring:bind path="rate.rateDescription">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label for="desc">Description:</label><br>
                    <form:textarea cssClass="textarea is-medium is-hovered has-fixed-size" id="desc" cols="70" rows="5" path="rateDescription"/><br>
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