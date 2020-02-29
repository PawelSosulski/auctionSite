<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:forEach items="${mainCategories}" var="category">
    <div class="card is-fullwidth is-success">
        <div class="card-header">
            <p class="card-header-title"><a
                    href="/auction?id=${category.id}">${category.name}</a></p>
            <a class="card-header-icon card-toggle">
                <i class="fa fa-angle-down"></i>
            </a>
        </div>
        <div class="card-content is-hidden">
            <div class="content">
                <c:forEach items="${categories}" var="subCategory">
                    <c:if test="${category.id == subCategory.parentId}">
                        -> <a href="/auction?id=${subCategory.id}">${subCategory.name}</a><br>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</c:forEach>

<script src="/resources/js/more-information.js"></script>
