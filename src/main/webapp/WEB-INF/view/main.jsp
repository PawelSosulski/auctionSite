<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<section class="section">
    <div class="columns is-desktop">
        <div class="column is-one-fifth-desktop">
            <jsp:include page="fragments/category-list2.jsp"/>
        </div>

        <div class="column is-four-fifths-desktop">
            <div>
                <h2 class="title panel is-primary">Promoted auctions</h2>
                <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Time left</th>
                    </tr>
                    <c:forEach items="${promotedAuctions}" var="promotedAuction" varStatus="stat">
                        <c:url value="auction/${promotedAuction.id}" var="auctionUrl"/>
                        <tr>
                            <td>${stat.count}</td>
                            <td><a href="${auctionUrl}">${promotedAuction.title}</a></td>
                            <td>${promotedAuction.actualPrice}</td>
                            <td>
                                <div id="timer-promoted-${promotedAuction.id}"></div>
                            </td>

                            <script>
                                function Run(div) {
                                    let countDown = new Date("${promotedAuction.dateEnded}").getTime();
                                    let x = setInterval(function () {
                                        let now = new Date().getTime();
                                        let distance = countDown - now;
                                        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                        let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                        if (days !== 0) {

                                            div.innerHTML = days + "d " + hours + "h "
                                                + minutes + "m " + seconds + "s ";
                                        } else {
                                            div.innerHTML = hours + "h "
                                                + minutes + "m " + seconds + "s ";
                                        }
                                        if (distance < 0) {
                                            clearInterval(x);
                                            div.innerHTML = "ENDED";
                                        }
                                    }, 1000);
                                }

                                Run(document.getElementById("timer-promoted-${promotedAuction.id}"));
                            </script>

                        </tr>
                    </c:forEach>
                </table>
            </div>

        <div class="column is-four-fifths-desktop">
            <div>
                <h2 class="title panel is-primary">Last added auctions</h2>
                <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Time left</th>
                    </tr>
                    <c:forEach items="${lastAuctions}" var="lastAuction" varStatus="stat">
                        <c:url value="auction/${lastAuction.id}" var="auctionUrl"/>
                        <tr>
                            <td>${stat.count}</td>
                            <td><a href="${auctionUrl}">${lastAuction.title}</a></td>
                            <td>${lastAuction.actualPrice}</td>
                            <td>
                                <div id="timer-last-${lastAuction.id}"></div>
                            </td>

                            <script>
                                function Run(div) {
                                    let countDown = new Date("${lastAuction.dateEnded}").getTime();
                                    let x = setInterval(function () {
                                        let now = new Date().getTime();
                                        let distance = countDown - now;
                                        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                        let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                        if (days !== 0) {

                                            div.innerHTML = days + "d " + hours + "h "
                                                + minutes + "m " + seconds + "s ";
                                        } else {
                                            div.innerHTML = hours + "h "
                                                + minutes + "m " + seconds + "s ";
                                        }
                                        if (distance < 0) {
                                            clearInterval(x);
                                            div.innerHTML = "ENDED";
                                        }
                                    }, 1000);
                                }

                                Run(document.getElementById("timer-last-${lastAuction.id}"));
                            </script>

                        </tr>
                    </c:forEach>
                </table>
                <div class="buttons is-right">
                <form:form method="post" action="/auction" modelAttribute="filter">
                    <input type="hidden" name="categoryId" value="0">
                    <input type="hidden" name="sort" value="timeASC">
                    <input type="hidden" name="onlyBuyNow" value=false>

                    <button class="button is-primary is-right" type="submit">
                        <span>View more</span>
                        <span class="icon is-right" aria-hidden="true">
                            <i class="fa fa-arrow-alt-circle-right" aria-hidden="true"></i>
                        </span>
                    </button>
                </form:form>
                </div>
            </div>
            <div>
                <h2 class="title panel is-primary">Ending auctions</h2>
                <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Time left</th>
                    </tr>
                    <c:forEach items="${endingAuctions}" var="endingAuction" varStatus="stat">
                        <c:url value="auction/${endingAuction.id}" var="auctionUrl"/>
                        <tr>
                            <td>${stat.count}</td>
                            <td><a href="${auctionUrl}">${endingAuction.title}</a></td>
                            <td>${endingAuction.actualPrice}</td>
                            <td>
                                <div id="timer-end-${endingAuction.id}"></div>
                            </td>
                        </tr>
                        </div>
                        <script>
                            function Run(div) {
                                let countDown = new Date("${endingAuction.dateEnded}").getTime();
                                let x = setInterval(function () {
                                    let now = new Date().getTime();
                                    let distance = countDown - now;
                                    let days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                    let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                    if (days !== 0) {

                                        div.innerHTML = days + "d " + hours + "h "
                                            + minutes + "m " + seconds + "s ";
                                    } else {
                                        div.innerHTML = hours + "h "
                                            + minutes + "m " + seconds + "s ";
                                    }
                                    if (distance < 0) {
                                        clearInterval(x);
                                        div.innerHTML = "ENDED";
                                    }
                                }, 1000);
                            }

                            Run(document.getElementById("timer-end-${endingAuction.id}"));
                        </script>
                    </c:forEach>
                </table>
                <div class="buttons is-right">
                <form:form method="post" action="/auction" modelAttribute="filter">
                    <input type="hidden" name="categoryId" value="0">
                    <input type="hidden" name="sort" value="timeDES">
                    <input type="hidden" name="onlyBuyNow" value=false>
                    <button class="button is-primary" type="submit">
                        <span>View more</span>
                        <span class="icon is-right">
                            <i class="fa fa-arrow-alt-circle-right"></i>
                        </span>
                    </button>
                </form:form>
                </div>
            </div>
        </div>

</section>
