import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "picto" ]

  connect() {
    console.log("Hello world")
  }

  toggle() {
    this.pictoTarget.classList.toggle("active")
  }
}
