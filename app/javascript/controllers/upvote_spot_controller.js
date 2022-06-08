import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["vote"]

  connect() {
  }

  post(event) {
    event.preventDefault()
    event.stopPropagation()
    const url = event.currentTarget.attributes['href'].value

    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() },
    })
    .then(response => response.text())
    .then((data)=> {
      this.voteTarget.outerHTML = data
    })
  }

  patch(event) {
    event.preventDefault()
    event.stopPropagation()
    const url = event.currentTarget.attributes['href'].value
    if (event.currentTarget.querySelector('.fa-thumbs-up')) {
      const burst = new mojs.Burst({
        left: -10, top: 0,
        radius: { 4: 40},
        count: 14,
        timeline: {delay: 100},
        children: {
          radius: 3,
          fill: '#5FC1FA',
          scale: {1 : 0, easing: 'quad.in'},
          pathScale: [.8, null],
          degreeShift: [300, null],
          duration: [500, 700],
          easing: 'quint.out'
        }
      });
      burst
      .tune({ x: event.pageX, y: event.pageY })
      .replay();
    }
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() },
    })
    .then(response => response.text())
    .then((data)=> {
      this.voteTarget.outerHTML = data
    })
  }
}
