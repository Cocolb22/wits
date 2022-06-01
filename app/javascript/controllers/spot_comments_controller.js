import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "list", "btn", "rating", "input"]

  connect() {
    console.log(this.formTarget)
    console.log(this.contentInputTarget)
    console.log(this.inputTargets)
  }

  post(event) {
    event.preventDefault()
    let isValid = true

    this.inputTargets.forEach((input) => {
      if (!input.value.trim() || input.value.trim() === "") {
        input.classList.add("invalid")
        input.insertAdjacentHTML('afterend', '<p class="invalid-input">Ce champ doit être rempli.</p>')
        input.focus()

        isValid = false
      }
    })

    if (isValid) {
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
}
