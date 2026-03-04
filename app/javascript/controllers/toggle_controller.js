import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hideable", "show", "mainContent"]

  connect() {
    // Sidebar fermée au chargement
    this.hideableTarget.classList.add("d-none")
    this.showTarget.classList.remove("d-none")
    this.mainContentTarget.classList.remove("col-md-7")
    this.mainContentTarget.classList.add("col-md-9")
  }

  call(event) {
    event.preventDefault()

    const isHidden = this.hideableTarget.classList.contains("d-none")

    if (isHidden) {
      // 👉 On ouvre la sidebar
      this.hideableTarget.classList.remove("d-none")
      this.showTarget.classList.add("d-none")
      this.mainContentTarget.classList.remove("col-md-9")
      this.mainContentTarget.classList.add("col-md-7")
    } else {
      // 👉 On ferme la sidebar
      this.hideableTarget.classList.add("d-none")
      this.showTarget.classList.remove("d-none")
      this.mainContentTarget.classList.remove("col-md-7")
      this.mainContentTarget.classList.add("col-md-9")
    }
  }
}
