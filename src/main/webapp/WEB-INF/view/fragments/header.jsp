<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<section class="hero is-primary is-medium">
    <!-- Hero head: will stick at the top -->
    <div class="hero-head">
        <nav class="navbar">
            <div class="container">
                <div class="navbar-brand">
                    <a class="navbar-item" href="/">
                        <img src="https://assets.allegrostatic.com/metrum/brand/allegro-347440b030.svg" alt="Logo">
                    </a>
                    <span class="navbar-burger burger" data-target="navbarMenuHeroA">
            <span></span>
            <span></span>
            <span></span>
          </span>
                </div>
                <div id="navbarMenuHeroA" class="navbar-menu">
                    <div class="navbar-end">
                        <a class="navbar-item is-active" href="/">
                            Home
                        </a>
                        <a class="navbar-item" href="/auction">
                            Auctions
                        </a>
                        <sec:authorize access="isAnonymous()">
                        <span class="navbar-item">
                            <a class="button is-primary is-inverted" href="/login">
                                <span class="icon">
                                    <i class="fab fa-lock"></i>
                                </span>
                                <span>Login</span>
                            </a>
                            <a class="button is-primary is-inverted" href="/register">
                                <span class="icon">
                                    <i class="fab fa-cash-register"></i>
                                </span>
                            <span>Register</span>
                            </a>
                        </span>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                          <span class="navbar-item">
                            <a class="button is-primary is-inverted" href="/my-biddings">
                                <span class="icon">
                                    <i class="fab fa-bacon"></i>
                                </span>
                                <span>My account</span>
                            </a>
                            <a class="button is-primary is-inverted" href="/logout">
                                <span class="icon">
                                    <i class="fab fa-sign-out"></i>
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
