import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "picto" ]

  connect() {
  }

  toggle() {
    console.log("Hello world")
    this.pictoTarget.classList.toggle("active")
  }
}
