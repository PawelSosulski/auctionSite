<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<section class="section">
    <div class="container">
        <h1 class="title is-1 page-title">My account</h1>

        <c:if test="${param['save'] == 'success'}">
            <div class="notification is-success">
                <button class="delete"></button>
                <p>Data has been saved successfully.</p>
            </div>
        </c:if>

        <c:if test="${param['premium'] == 'success'}">
            <div class="notification is-success">
                <button class="delete"></button>
                <p>Your account has been update to PREMIUM.</p>
            </div>
        </c:if>

        <form:form action="/my-account" method="POST" modelAttribute="myAccount">
            <div class="columns">

                <div class="column">
                    <div class="field">
                        <label class="label">Name</label>
                        <div class="control">
                            <form:input cssClass="input" path="name"/>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Last name</label>
                        <div class="control">
                            <form:input cssClass="input" path="lastName"/>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Email</label>
                        <div class="control has-icons-left has-icons-right">
                            <form:input cssClass="input" path="username"/>
                            <span class="icon is-small is-left"><i class="fas fa-envelope"></i></span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Username</label>
                        <div class="control has-icons-left has-icons-right">
                            <form:input cssClass="input" path="login" readonly="true" style="color: Grey; opacity: 1;"/>
                            <span class="icon is-small is-left"><i class="fas fa-user"></i></span>
                        </div>
                    </div>
                </div>

                <div class="column">
                    <div class="field">
                        <label class="label">City</label>
                        <div class="control">
                            <form:input cssClass="input" path="city"/>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Street</label>
                        <div class="control">
                            <form:input cssClass="input" path="street"/>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Street number</label>
                        <div class="control">
                            <form:input cssClass="input" path="streetNumber"/>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Zip code</label>
                        <div class="control">
                            <form:input cssClass="input" path="zipCode"/>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Province</label>
                        <div class="control">
                            <form:input cssClass="input" path="province"/>
                        </div>
                    </div>
                    <div class="field is-grouped">
                        <div class="control">
                            <button class="button is-success" name="uploadData" type="submit">Save</button>
                        </div>
                        <div class="control">
                            <c:if test="${myAccount.type == 'NORMAL'}">
                                <form action="/my-account" method="POST">
                                    <button class="button is-success" name="getPremium" type="submit">Get Premium
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="column">
                        <div class="field">
                            <div class="label" for="file">Avatar</div>
                            <div>
                                <c:choose>
                                    <c:when test="${avatarId!=0}">
                                        <figure class="image">
                                            <img class="image is-rounded" style="image-orientation: from-image;width: 240px;object-fit: cover"
                                                 src="/my-account/img/${avatarId}" alt="Avatar">
                                        </figure>
                                    </c:when>
                                    <c:otherwise>
                                        <div>
                                            There is no avatar.
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <br>
                            <div class="label" for="file">Change avatar</div>

                            <c:if test="${error!=null}">
                            <div class="notification is-danger">
                                <button class="delete"></button>
                                <p>Something went wrong.</p>
                            </div>
                            </c:if>
                            <form enctype="multipart/form-data" method="post">
                            <div class="field is-grouped">
                                <div class="control">
                                    <div class="file has-name">
                                        <label class="file-label">
                                            <input class="file-input" type="file" name="file" id="file"
                                                   accept="image/*">
                                            <span class="file-cta">
                                      <span class="file-icon">
                                        <i class="fas fa-upload"></i>
                                      </span>
                                      <span class="file-label">
                                        Pick photo
                                      </span>
                                    </span>
                                            <span class="file-name">
                                      ---
                                    </span>
                                        </label>
                                    </div>
                                </div>
                                <div class="control">
                                    <button class="button is-success" name="uploadPhoto" type="submit">
                                        Change
                                    </button>
                                </div>
                            </div>
                                <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </form:form>
    </div>
</section>

<script src="/resources/js/close-notification.js"></script>
<script src="/resources/js/avatar.js"></script>