<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section class="hero is-success is-medium">
    <!-- Hero head: will stick at the top -->
    <div class="hero-head">
        <nav class="navbar">
            <div class="container">
                <div class="navbar-brand">
                    <a class="navbar-item" href="/">
                        <p>Auction Site</p>
                    </a>
                    <span class="navbar-burger burger" data-target="navbarMenuHeroA">
                         <span></span>
                         <span></span>
                         <span></span>
                    </span>
                </div>
                <div id="navbarMenuHeroA" class="navbar-menu">
                    <div class="navbar-end">
                        <a class="navbar-item header-item" href="/">Home</a>
                        <a class="navbar-item header-item" href="/auction">Auctions</a>
                        <sec:authorize access="isAnonymous()">
                        <span class="navbar-item">
                            <a class="button is-success is-inverted header-button" href="/login">
                                <span>Login</span>
                                <span class="icon is-right">
                                    <i class="fa fa-lock-open"></i>
                                </span>
                            </a>
                            <a class="button is-success is-inverted header-button" href="/register">
                            <span>Register</span>
                                <span class="icon">
                                    <i class="fa fa-user-edit"></i>
                                </span>
                            </a>
                        </span>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                          <span class="navbar-item">
                            <a class="button is-success is-inverted header-button" href="/my-biddings">
                                <span class="icon">
                                    <i class="fa fa-user"></i>
                                </span>
                                <span>My profile</span>
                            </a>
                            <a class="button is-success is-inverted header-button" href="/logout">
                                <span class="icon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <span>Logout</span>
                            </a>
                        </span>
                        </sec:authorize>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</section>
<%--


<div>
    <div>
        <sec:authorize access="isAuthenticated()">
            <div style="margin-right: 20px"> Witaj,
                <strong>${pageContext.request.userPrincipal.principal.username}</strong></div>
        </sec:authorize>
    </div>
    <br>
    <ul>
        <li><a href="/">Main site</a></li>
        <li><a href="/auction">Auctions</a></li>
        <sec:authorize access="isAnonymous()">
            <li><a href="/register">Register</a></li>
            <li><a href="/login">Login</a></li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li><a href="/logout">Logout</a></li>
            <li><a href="/my-biddings">My panel</a></li>
        </sec:authorize>
    </ul>
</div>--%>
