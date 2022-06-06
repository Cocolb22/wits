import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["pills"]

  connect() {
  }

  active(event) {
    console.log(this.pillsTarget);
    this.pillsTarget.classList.add("active")
  }
}
