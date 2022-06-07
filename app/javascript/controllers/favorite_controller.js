import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["button"]
  connect() {
  }
  create(event) {
    event.preventDefault()
    event.stopPropagation()

    const url = event.currentTarget.attributes['href'].value
    const method = event.currentTarget.dataset.method

    fetch(url, {
      method: method.toUpperCase(),
      headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() }
    })
      .then(response => response.text())
      .then((data) => {
        this.buttonTarget.innerHTML = data
      })
  };
}
