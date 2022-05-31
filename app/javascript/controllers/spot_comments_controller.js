import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "list"]

  connect() {
    console.log(this.formTarget)
    console.log(this.contentInputTarget)
    console.log(this.ratingInputTarget)
  }

  post(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.success) {
          this.listTarget.insertAdjacentHTML('afterbegin', data.partial)
          this.formTarget.outerHTML = data.form
        } else {
          this.formTarget.outerHTML = data.form
        }
      })
  }
}
