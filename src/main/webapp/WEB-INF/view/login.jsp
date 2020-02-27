<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="section">
    <div class="container">
        <div class="columns">
            <div class="column"></div>

            <div class="column has-text-centered">
                <div>
                    <h1 class="title is-1 page-title">LOGIN</h1>
                </div>

                <c:if test="${param['error'] != null}">
                    <div class="notification is-danger">
                        <button class="delete"></button>
                        <p>Incorrect login or password. Please try again.</p>
                    </div>
                </c:if>
                <c:if test="${param['register'] == 'success'}">
                    <div class="notification is-success">
                        <button class="delete"></button>
                        <p>Registration was successful. You can now login.</p>
                    </div>
                </c:if>

                <form action="/login" method='POST'>
                    <div class="field is-center">
                        <p class="control has-icons-left has-icons-right">
                            <input autofocus class="input" name="username" type="text" placeholder="Login">
                            <span class="icon is-small is-left"><i class="fa fa-user"></i></span>
                        </p>
                    </div>
                    <div class="field">
                        <p class="control has-icons-left">
                            <input class="input" name="password" type="password" placeholder="Password">
                            <span class="icon is-small is-left"><i class="fas fa-lock"></i></span>
                        </p>
                    </div>
                    <div class="field">
                        <p class="control has-text-centered">
                            <button class="button is-success">
                                Login
                            </button>
                        </p>
                    </div>
                    <sec:csrfInput/>
                </form>
            </div>
            <div class="column"></div>

        </div>
    </div>
</section>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
            $notification = $delete.parentNode;

            $delete.addEventListener('click', () => {
                $notification.parentNode.removeChild($notification);
            });
        });
    });
</script>
