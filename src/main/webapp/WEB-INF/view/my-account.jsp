<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div>
    <h2>My account</h2>
    <sf:form method="post" action="/my-account" modelAttribute="myAccount">
        Account type: <b>${myAccount.type}</b><br>
        Username: <sf:input path="username" readonly="true" style="color: Grey; opacity: 1;"/><br>
        Login: <sf:input path="login" readonly="true" style="color: Grey; opacity: 1;"/><br>
        Name: <sf:input path="name"/><br>
        Last name: <sf:input path="lastName"/><br>
        Street: <sf:input path="street"/><br>
        Street number: <sf:input path="streetNumber"/><br>
        City: <sf:input path="city"/><br>
        Zip code: <sf:input path="zipCode"/><br>
        Province: <sf:input path="province"/><br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Save</button>

    </sf:form>


        <c:if test="${myAccount.type == 'NORMAL'}">
            <sf:form method="post" action="/my-account" modelAttribute="myAccount">
                <input hidden name="login" value="${myAccount.login}">
                <input hidden name="type" value="PREMIUM">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Get Premium</button>
            </sf:form>
        </c:if>



</div>
