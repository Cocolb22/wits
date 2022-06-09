import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  connect() {
    console.log("Hello from levelup")
    this.channel = consumer.subscriptions.create("NotificationsChannel", {
      received(data) {
        console.log("la data récupérée après création du channel level up");
        console.log(data);

        document.getElementById("status").innerText = data.user.status
        document.getElementById("exp").innerText = data.user.profile_exp
        document.getElementById("exp").setAttribute("value", data.user.profile_exp)

        let levelUp = document.querySelector(".container-level-up")
        levelUp.classList.remove("d-none")
        // console.log("level up");
        // console.log(levelUp);

        const jsConfetti = new JSConfetti();

        jsConfetti.addConfetti({
          confettiNumber: 300,
          confettiColors: [
            '#5FC1FA', '#D9E3E8', '#9FB9C6', '#4D666F'
          ]
        })
        console.log("jsConfetti");
        console.log(jsConfetti);

        const counterAnim = (element, start = 0, end, duration = 1000) => {
          const target = document.querySelector('.total-points-value');
          let startTimestamp = null;
          const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            target.innerText = Math.floor(progress * (end - start) + start);
            if (progress < 1) {
              window.requestAnimationFrame(step);
            }
          };
          window.requestAnimationFrame(step);
        };

        const pointsCounterText = document.querySelector('.total-points-value');
        let pointsValue = Number(pointsCounterText.getAttribute("value"));

        counterAnim(".total-points-value", 0, pointsValue, 2500);
      }
    })
  }
}
