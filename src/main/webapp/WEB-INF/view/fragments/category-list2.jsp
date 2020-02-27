<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>


    <div id="accordion">
        <c:forEach items="${mainCategories}" var="category">
            <div class="card">
                <button class="button is-success" type="button" data-toggle="collapse"
                        data-target="#collapse-${category.id}"
                        aria-expanded="false" aria-controls="collapse-${category.id}">${category.name}
                </button>
                <div class="collapse" id="collapse-${category.id}" data-parent="#accordion">
                    <div class="card-body">
                        <ul>
                            <li><span><a href="/auction?id=${category.id}">
                                  <span>${category.name}</span>
                        </a></span></li>
                            <c:forEach items="${categories}" var="subCategory">
                                <c:if test="${category.id == subCategory.parentId}">
                                    <li><span><a href="/auction?id=${subCategory.id}">
                                <span class="icon is-left" aria-hidden="true">
                                        <i class="fa fa-arrow-right" aria-hidden="true"></i>
                                  </span>
                                    <span>${subCategory.name}</span>
                                </a></span>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>