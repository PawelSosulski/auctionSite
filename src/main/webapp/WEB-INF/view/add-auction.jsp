<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="section">
    <div class="container">

        <h1 class="title is-1 page-title">Add new auction</h1>

        <form:form method="post" enctype="multipart/form-data" modelAttribute="newAuction">
            <div class="columns">
                <div class="column">
                    <div class="field">
                        <label class="label">Title</label>
                        <div class="control">
                            <form:input cssClass="input" id="title" path="title"/>
                            <form:errors path="title"/><br>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Description</label>
                        <div class="control">
                            <form:textarea cssClass="textarea has-fixed-size" id="description" path="description"/>
                            <form:errors path="description"/><br>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Start price</label>
                        <div class="control">
                            <form:input cssClass="input" id="startPrice" path="startPrice"/>
                            <form:errors path="startPrice"/><br>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Buy now price</label>
                        <div class="control">
                            <form:input cssClass="input" id="buyNowPrice" path="buyNowPrice"/><br>
                            <form:errors path="buyNowPrice"/><br>
                        </div>
                    </div>

                </div>

                <div class="column">
                    <div class="field">
                        <label class="label">Days to end</label>
                        <div class="control">
                            <div class="select">
                                <form:select id="days" path="days">
                                    <form:options items="${daysList}"/>
                                </form:select>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Category</label>
                        <div class="control">
                            <div class="select">
                                <select name="categoryId">
                                    <option hidden>-- Select categories --</option>
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
                    </div>
                    <div class="field">
                        <div class="control">
                            <button name="save" class="button is-success is-right" type="submit">
                                <span>Next</span>
                                <span class="icon is-right" aria-hidden="true">
                            <i class="fa fa-arrow-alt-circle-right" aria-hidden="true"></i>
                        </span>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="column">
                    <div class="field">
                        <label class="label">Auction type</label>
                        <div class="control">
                            <c:choose>
                                <c:when test="${isUserPromo}">
                                    <article class="message is-success">
                                        <div class="message-header">
                                            <p>Premium user</p>
                                        </div>
                                        <div class="message-body">
                                            <div>
                                                <form:radiobutton path="auctionType" value="${'NORMAL'}"/>
                                                <span >NORMAL</span>
                                            </div>
                                            <div>
                                                <form:radiobutton path="auctionType" value="${'PROMOTED'}"/>
                                                <span>PROMOTED</span>
                                            </div>
                                        </div>
                                    </article>
                                </c:when>
                                <c:otherwise>
                                    <article class="message is-warning">
                                        <div class="message-header">
                                            <p><a href="/my-account">Get Premium</a> to unlock!</p>
                                        </div>
                                        <div class="message-body">
                                            <div>
                                                <form:radiobutton path="auctionType" disabled="true" value="${'NORMAL'}"/>
                                                <span style="color: Grey; opacity: 1;">NORMAL</span>
                                            </div>
                                            <div>
                                                <form:radiobutton path="auctionType" disabled="true" value="${'PROMOTED'}"/>
                                                <span style="color: Grey; opacity: 1;">PROMOTED</span>
                                            </div>
                                        </div>
                                    </article>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

            </div>


            <%--<form:hidden path="auctionType"/>--%>
            <%--<form:hidden path="photo"/>--%>
        </form:form>

    </div>
</section>




