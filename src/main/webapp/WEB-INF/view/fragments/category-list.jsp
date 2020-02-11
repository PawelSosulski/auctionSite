<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="treeRoot">
    <li class="hasSubMenu"><span>Kategorie</span>
        <ul class="activeSubMenu">
            <c:forEach items="${mainCategories}" var="category">
                <li class="hasSubMenu"><span>${category.name}</span>
                    <ul>
                        <c:forEach items="${categories}" var="subCategory">
                            <c:if test="${category.id == subCategory.parentId}">
                                <li><span>${subCategory.name}</span></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </li>
</ul>