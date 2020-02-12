<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="category-menu">
    <ul>
        <c:forEach items="${mainCategories}" var="category">
            <li><span>${category.name}</span>
                <ol>
                    <c:forEach items="${categories}" var="subCategory">
                        <c:if test="${category.id == subCategory.parentId}">
                            <li><span>${subCategory.name}</span></li>
                        </c:if>
                    </c:forEach>
                </ol>
            </li>
        </c:forEach>
    </ul>
</div>

