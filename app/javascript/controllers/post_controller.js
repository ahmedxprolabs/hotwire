import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ["body"]

  toggle() {
    this.bodyTarget.classList.toggle("hidden")
  }
}
