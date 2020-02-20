<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>Observe auctions</h2>
<table border=1px>
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Description</th>
        <th>Category</th>
        <th>Price</th>
        <th>Time to end</th>
        <th>Usuń</th>
    </tr>
    <c:forEach items="${observeAuctions}" var="auction" varStatus="stat">
        <c:url value="/auction/${auction.id}" var="auctionUrl"/>
        <tr>
            <td>${stat.index+1}</td>
            <td><a href="${auctionUrl}">${auction.title}</a></td>
            <td><a href="${auctionUrl}">${auction.description}</a></td>
            <td>${auction.categoryName}</td>
            <td>${auction.buyNowPrice}</td>
            <td><div id="timer-${auction.id}"></div></td>
            <td>Usuń z obserwowanych</td>
        </tr>

        <script>
            function Run(div) {
                let countDown = new Date("${auction.dateEnded}").getTime();
                let x = setInterval(function () {
                    let now = new Date().getTime();
                    let distance = countDown - now;


                    let days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    div.innerHTML = days + "d " + hours + "h "
                        + minutes + "m " + seconds + "s ";

                    if (distance < 0) {
                        clearInterval(x);
                        div.innerHTML = "ENDED";
                    }
                }, 1000);
            }
            Run(document.getElementById("timer-${auction.id}"));
        </script>
    </c:forEach>
</table>
