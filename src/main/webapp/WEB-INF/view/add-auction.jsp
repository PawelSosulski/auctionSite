<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h3>Add new auction</h3>

<form:form method="post" enctype="multipart/form-data" modelAttribute="newAuction">
    <spring:bind path="title">
        <div>
            <label for="title">Title:</label>
            <form:errors/>
            <form:input id="title" path="title"/>
        </div>
    </spring:bind>
    <spring:bind path="description">
        <div>
            <label for="description">Description:</label>
            <form:errors/>
            <form:textarea id="desciption" cols="70" rows="15" path="description"/>
        </div>
    </spring:bind>
    <spring:bind path="startPrice">
        <div>
            <label for="startPrice">Start price:</label>
            <form:errors/>
            <form:input in="startPrice" path="startPrice"/>
        </div>
    </spring:bind>
    <spring:bind path="buyNowPrice">
        <div>
            <label for="buyNowPrice">Buy now price:</label>
            <form:errors/>
            <form:input in="buyNowPrice" path="buyNowPrice"/>
        </div>
    </spring:bind>

    <select name="categoryId" onmousedown="if(this.options.length>8){this.size=8;}" onchange='this.size=0;'
            onblur="this.size=0;">
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

    <form:select path="days">
        <form:options items="${daysList}"/>
    </form:select>

    <button class="button is-primary" type="submit">Add</button>
</form:form>


