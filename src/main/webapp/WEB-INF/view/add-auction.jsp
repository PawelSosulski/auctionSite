<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h3>Add new auction</h3>

<form:form method="post" enctype="multipart/form-data" modelAttribute="newAuction">
    <spring:bind path="title">
        <div>
            <label for="title">Title:</label><br>
            <form:input id="title" path="title"/><br>
            <form:errors path="title"/><br>
        </div>
    </spring:bind>
    <spring:bind path="description">
        <div>
            <label for="description">Description:</label><br>
            <form:textarea id="desciption" cols="60" rows="8" cssStyle="resize: none" path="description"/><br>
            <form:errors path="description"/><br>
        </div>
    </spring:bind>
    <spring:bind path="startPrice">
        <div>
            <label for="startPrice">Start price:</label><br>
            <form:input in="startPrice" path="startPrice"/><br>
            <form:errors path="startPrice"/><br>
        </div>
    </spring:bind>
    <spring:bind path="buyNowPrice">
        <div>
            <label for="buyNowPrice">Buy now price:</label><br>
            <form:input in="buyNowPrice" path="buyNowPrice"/><br>
            <form:errors path="buyNowPrice"/><br>
        </div>
    </spring:bind>

    <select name="categoryId" onmousedown="if(this.options.length>8){this.size=8;}" onchange='this.size=0;'
            onblur="this.size=0;">
        <option hidden>-- Select categories --</option>
        <c:forEach items="${mainCategories}" var="category">
            <optgroup label="${category.name}">
                <c:forEach items="${categories}" var="subCategory">
                    <c:if test="${category.id == subCategory.parentId}">
                        <option <c:if test="${subCategory.id==newAuction.categoryId}">selected</c:if>
                                value="${subCategory.id}">${subCategory.name}</option>
                    </c:if>
                </c:forEach>
            </optgroup>
        </c:forEach>
    </select><br>

    <label for="days">Number od days:</label><br>
    <form:select id="days" path="days">
        <form:options items="${daysList}"/>
    </form:select><br><br>

    <button name="next" class="button is-primary is-right" type="submit">
        <span>Next</span>
        <span class="icon is-right" aria-hidden="true">
            <i class="fa fa-arrow-alt-circle-right" aria-hidden="true"></i>
        </span>
    </button>
    <form:hidden path="auctionType"/>
    <%--<form:hidden path="photo"/>--%>
</form:form>


