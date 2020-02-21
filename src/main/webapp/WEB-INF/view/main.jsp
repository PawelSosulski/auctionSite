<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<h1>Start</h1>
<div>
    Kategorie
    <jsp:include page="fragments/category-list.jsp"/>

</div>
<div>
    <h2>Last added auctions</h2>
    <table border="1px">
        <tr>
            <th>title</th>
            <th>price</th>
            <th>time</th>
        </tr>
        <c:forEach items="${lastAuctions}" var="lastAuction" varStatus="stat">
            <c:url value="auction/${lastAuction.id}" var="auctionUrl"/>
            <tr>
                <td>${lastAuction.title}</td>
                <td>${lastAuction.actualPrice}</td>
                <td>
                    <div id="timer-${lastAuction.id}"></div>
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
                    Run(document.getElementById("timer-${lastAuction.id}"));
                </script>

            </tr>
        </c:forEach>
    </table>
</div>