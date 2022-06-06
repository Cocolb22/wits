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
