<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div>
    <div>
        <sec:authorize access="!isAuthenticated()">
            <div style="margin-right: 20px"> Witaj, <strong>nieznajomy</strong></div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div style="margin-right: 20px"> Witaj, <strong>${pageContext.request.userPrincipal.principal.username}</strong></div>
        </sec:authorize>
    </div>
<br>
    <ul>
        <li><a href="/">Main site</a></li>
        <li><a href="/register">Register</a></li>
        <li><a href="/login">Login</a></li>
        <li><a href="/logout">Logout</a></li>
        <li><a href="/auction">Auctions</a></li>
        <li><a href="/my-account">My account</a></li>
    </ul>
</div>