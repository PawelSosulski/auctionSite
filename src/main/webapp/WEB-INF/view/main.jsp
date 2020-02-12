<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


    <!--    <link rel="stylesheet" href="${contextPath}/resources/css/style.css"> -->
    <style>
        <%@include file="/resources/css/style.css" %>
    </style>


<h1>Start</h1>
<div>
    Kategorie
    <jsp:include page="fragments/category-list.jsp"/>
</div>
