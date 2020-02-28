<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="count" value="${[5,4,3,2,1]}"/>

<section class="section">
    <div class="container">
        <h1 class="title is-1 page-title">Rate auction</h1>
        <div class="columns">
            <div class="column"></div>
            <div class="column is-two-thirds">
                <div class="field is-grouped">
                    <div class="control"><label class="label">Auction</label></div>
                    <div class="control"><p>${rate.auctionTitle}</p></div>
                </div>

                <form:form action="/rate-add" method="post" modelAttribute="rate">
                    <div class="field is-grouped">
                        <div class="control">
                            <label class="label" for="rateValue">Rate</label>
                        </div>
                        <div class="control">
                        <span class="select is-focused">
                        <select id="rateValue" name="rateValue">
                            <c:forEach items="${count}" var="value">
                                <option value="${value}">${value}</option>
                            </c:forEach>
                        </select>
                    </span>
                        </div>
                    </div>

                    <div class="field">
                        <spring:bind path="rate.rateDescription">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="label" for="desc">Description</label><br>
                                <form:textarea cssClass="textarea is-medium is-hovered has-fixed-size" id="desc"
                                               cols="70"
                                               rows="5"
                                               path="rateDescription"/><br>
                                <form:errors path="rateDescription"/>
                            </div>
                        </spring:bind>
                    </div>
                    <form:hidden path="auctionTitle"/>
                    <form:hidden path="purchaseId"/>
                    <form:hidden path="role"/>

                    <div class="field">
                        <p class="control has-text-centered">
                            <button class="button is-success" type="submit">
                                Rate!
                            </button>
                        </p>
                    </div>
                </form:form>
            </div>
            <div class="column"></div>
        </div>
    </div>
</section>