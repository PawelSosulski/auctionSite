<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.auction.utils.enums.AuctionType" %>
<div class="columns is-desktop">
    <div class="column">
        <h3 class="title">${newAuction.title}</h3>
        <div>
            Description:<br>
            ${newAuction.description}<br>
        </div>
        <div>
            Start price:<br>
            ${newAuction.startPrice}<br>
        </div>
        <div>
            Buy now:<br>
            ${newAuction.buyNowPrice}<br>
        </div>

        <%--<div>
            Seller:<br>
            ${seller.username}<br>
        </div>
        <div>
            Category:<br>
            ${category.parentName} > ${category.name}<br>
        </div>--%>
        <%--<div>
            <br>
            Photos size: ${newAuction.photos.size()}<br>
        </div>--%>
        <form:form method="post" modelAttribute="newAuction">
            <div>
                <div>Auction type:</div>
                <c:choose>
                    <c:when test="${isUserPromo}">
                        <form:radiobutton path="auctionType" value="${AuctionType.NORMAL}"/>${AuctionType.NORMAL}<br>
                        <form:radiobutton path="auctionType" value="${AuctionType.PROMOTED}"/>${AuctionType.PROMOTED}
                        <br>
                    </c:when>
                    <c:otherwise>
                        <form:radiobutton path="auctionType" disabled="true"
                                          value="${AuctionType.NORMAL}"/>${AuctionType.NORMAL}<br>
                        <form:radiobutton path="auctionType" disabled="true"
                                          value="${AuctionType.PROMOTED}"/>${AuctionType.PROMOTED}<br>
                        <div>Get Premium!<br></div>
                    </c:otherwise>
                </c:choose>
            </div>
            <button name="edit" class="button is-primary is-right" type="submit">
                <span class="icon is-left" aria-hidden="true">
                    <i class="fa fa-arrow-alt-circle-left" aria-hidden="true"></i>
                </span>
                <span>Edit</span>
            </button>
            <button name="save" class="button is-primary is-right" type="submit">
                <span>Save</span>
                <span class="icon is-right" aria-hidden="true">
            <i class="fa fa-save" aria-hidden="true"></i>
        </span>
            </button>
            <form:hidden path="title"/>
            <form:hidden path="description"/>
            <form:hidden path="days"/>
            <form:hidden path="startPrice"/>
            <form:hidden path="buyNowPrice"/>
            <form:hidden path="categoryId"/>
            <form:hidden path="photo.contentType"/>
            <form:hidden path="photo.fileName"/>
            <form:hidden path="photo.dataAsString"/>
        </form:form>

    </div>
    <div class="column">
        <%--TODO --%>
        <form enctype="multipart/form-data" method="post">
            <input type="hidden" name="title" value="${newAuction.title}"/>
            <input type="hidden" name="description" value="${newAuction.description}"/>
            <input type="hidden" name="days" value="${newAuction.days}"/>
            <input type="hidden" name="startPrice" value="${newAuction.startPrice}"/>
            <input type="hidden" name="buyNowPrice" value="${newAuction.buyNowPrice}"/>
            <input type="hidden" name="categoryId" value="${newAuction.categoryId}"/>
            <input type="hidden" name="auctionType" value="${newAuction.auctionType}"/>

            <div class="field">
                <div class="label" for="file">Add photo</div>
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
                            Add
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
</div>





