import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "list", "btn", "rating"]

  connect() {
    console.log(this.formTarget)
    console.log(this.contentInputTarget)
    console.log(this.ratingInputTarget)
  }

  post(event) {
    event.preventDefault()
    const url = this.formTarget.action
    this.btnTarget.disabled = true
    this.btnTarget.innerHTML = '<div class="loader"></div>'
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.success) {
          this.ratingTarget.outerHTML = data.rating
          this.listTarget.insertAdjacentHTML('afterbegin', data.partial)
          this.formTarget.outerHTML = data.form
        } else {
          this.formTarget.outerHTML = data.form
        }
      })
  }
}
