<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<section class="section">
    <h2>My account</h2>
    <div class="columns is-desktop">
        <div class="column is-four-fifths-desktop">
            <form:form method="post" modelAttribute="myAccount">
                Username: <form:input path="username" readonly="true" style="color: Grey; opacity: 1;"/><br>
                Login: <form:input path="login" readonly="true" style="color: Grey; opacity: 1;"/><br>
                Name: <form:input path="name"/><br>
                Last name: <form:input path="lastName"/><br>
                Street: <form:input path="street"/><br>
                Street number: <form:input path="streetNumber"/><br>
                City: <form:input path="city"/><br>
                Zip code: <form:input path="zipCode"/><br>
                Province: <form:input path="province"/><br>
                <button class="button is-primary is-focused"
                        name="uploadData" type="submit">Save
                </button>
            </form:form>
          
          <c:if test="${myAccount.type == 'NORMAL'}">
            <sf:form method="post" action="/my-account" modelAttribute="myAccount">
                <input hidden name="login" value="${myAccount.login}">
                <input hidden name="type" value="PREMIUM">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Get Premium</button>
            </sf:form>
        </c:if>
          
            <div>
                <c:if test="${error!=null}">
                    ${error}
                </c:if>
            </div>
            <form enctype="multipart/form-data" method="post">
                <div class="field">
                    <div class="label" for="file">Change avatar</div>
                    <div class="file has-name">
                        <label class="file-label">
                            <input class="file-input" type="file" name="file" id="file" accept="image/*">
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

                    <div class="field is-grouped">
                        <div class="control">
                            <button class="button is-primary" name="uploadPhoto" type="submit">
                                Change
                            </button>
                        </div>
                    </div>
                    <script>
                        var fileInput = document.querySelector('#file');
                        fileInput.onchange = function () {
                            if (fileInput.files.length > 0) {
                                var fileName = document.querySelector('.file .file-name');
                                fileName.textContent = fileInput.files[0].name;
                            }
                        }
                    </script>
                    <sec:csrfInput/>
            </form>
        </div>
        <div class="column is-one-fifth-desktop">
            <c:choose>
                <c:when test="${avatarId!=0}">
                    <figure class="image">
                        <img style="image-orientation: from-image;width: 240px;object-fit: cover"
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
    </div>
</section>
