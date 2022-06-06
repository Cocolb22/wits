import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["button"]
  static values = {
    url: String,
    method: String
  }

  create(event) {
    event.preventDefault()
    event.stopPropagation()

    setTimeout(() => {
      fetch(this.urlValue, {
        method: this.methodValue,
        headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() }
      })
        .then(response => response.text())
        .then((data) => {
          this.buttonTarget.outerHTML = data
        })
    }, 1000)
  };
}
