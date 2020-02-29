<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<section class="section">
    <div class="container">
        <h1 class="title is-1 page-title">Register</h1>
        <form action="/register" method="POST">
            <div class="columns">
                <div class="column"></div>
                <div class="column">
                    <div class="field">
                        <label class="label">Username</label>
                        <div class="control has-icons-left has-icons-right">
                            <input class="input" type="text" name="login" placeholder="Enter username">
                            <span class="icon is-small is-left"><i class="fas fa-user"></i></span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Password</label>
                        <div class="control has-icons-left has-icons-right">
                            <input class="input" type="password" name="password" placeholder="Enter password">
                            <span class="icon is-small is-left"><i class="fas fa-key"></i></span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Confirm password</label>
                        <div class="control has-icons-left has-icons-right">
                            <input class="input" type="password" name="passwordConfirm" placeholder="Confirm password">
                            <span class="icon is-small is-left"><i class="fas fa-key"></i></span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Email</label>
                        <div class="control has-icons-left has-icons-right">
                            <input class="input" type="email" name="email" placeholder="Enter email">
                            <span class="icon is-small is-left"><i class="fas fa-envelope"></i></span>
                        </div>
                    </div>
                </div>
                <div class="column">
                    <div class="field">
                        <label class="label">Name</label>
                        <div class="control">
                            <input class="input" type="text" name="name" placeholder="Enter name">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Last name</label>
                        <div class="control">
                            <input class="input" type="text" name="lastName" placeholder="Enter last name">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">City</label>
                        <div class="control">
                            <input class="input" type="text" name="city" placeholder="Enter city">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Street</label>
                        <div class="control">
                            <input class="input" type="text" name="street" placeholder="Enter street">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Street number</label>
                        <div class="control">
                            <input class="input" type="text" name="streetNumber" placeholder="Enter street number">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Zip code</label>
                        <div class="control">
                            <input class="input" type="text" name="zipCode" placeholder="Enter zip code">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Province</label>
                        <div class="control">
                            <input class="input" type="text" name="province" placeholder="Enter province">
                        </div>
                    </div>
                    <div class="field">
                        <div class="control">
                            <button class="button is-link is-success is-pulled-right register-button">Register</button>
                        </div>
                    </div>
                </div>
                <div class="column"></div>
            </div>
        </form>
    </div>
</section>
