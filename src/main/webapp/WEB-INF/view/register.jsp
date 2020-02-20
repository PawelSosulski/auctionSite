<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="container">
    <form:form method="POST" action="/register" modelAttribute="newUser">
        <h2 class="form-signin-heading">Register</h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="username">Username: </label>
                <form:input path="username" id="username" type="text" placeholder="Username"
                            autofocus="true"/>
                <form:errors path="username"/>
            </div>
        </spring:bind>
        <spring:bind path="login">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="login">Login: </label>
                <form:input path="login" id="login" type="text" placeholder="Login"/>
                <form:errors path="login"/>
            </div>
        </spring:bind>
        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="password">Password: </label>
                <form:input path="password" id="password" type="password" placeholder="Password"/>
                <form:errors path="password"/>
            </div>
        </spring:bind>
        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="passwordConfirm">Confirm password: </label>
                <form:input path="passwordConfirm" id="passwordConfirm" type="password" placeholder="Confirm password"/>
                <form:errors path="passwordConfirm"/>
            </div>
        </spring:bind>
        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="name">Name: </label>
                <form:input path="name" id="name" type="text" placeholder="Name"/>
                <form:errors path="name"/>
            </div>
        </spring:bind>
        <spring:bind path="lastName">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="lastName">Lastname: </label>
                <form:input path="lastName" id="lastName" type="text" placeholder="Lastname"/>
                <form:errors path="lastName"/>
            </div>
        </spring:bind>
        <spring:bind path="city">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="city">City: </label>
                <form:input path="city" id="city" type="text" placeholder="City"/>
                <form:errors path="city"/>
            </div>
        </spring:bind>
        <spring:bind path="province">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="province">Province: </label>
                <form:input path="province" id="province" type="text" placeholder="Province"/>
                <form:errors path="province"/>
            </div>
        </spring:bind>
        <spring:bind path="street">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="street">Street: </label>
                <form:input path="street" id="street" type="text" placeholder="Street"/>
                <form:errors path="street"/>
            </div>
        </spring:bind>
        <spring:bind path="streetNumber">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="street-number">Street number: </label>
                <form:input path="streetNumber" id="street-number" type="text" placeholder="Street number"/>
                <form:errors path="streetNumber"/>
            </div>
        </spring:bind>
        <spring:bind path="zipCode">
            <div class="form-group ${status.error ? 'has error' : ''}">
                <label for="zip-code">Zip code: </label>
                <form:input path="zipCode" id="zip-code" type="text" placeholder="Zip Code"/>
                <form:errors path="zipCode"/>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
        <sec:csrfInput/>
    </form:form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
