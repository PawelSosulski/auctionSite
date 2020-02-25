function Run(div, dateEnded) {
    let countDown = dateEnded.getTime();
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