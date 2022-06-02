import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
  }
  like(event) {
    event.preventDefault()
    const seed = event.currentTarget
    // const seed = document.getElementById(seedId)
    seed.style.color = "#FFD470"
  };
}
