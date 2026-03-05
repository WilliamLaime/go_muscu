import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hideable", "show", "mainContent", "sidebarCol"]

  connect() {
    // Sidebar fermée au chargement
    this.hideableTarget.classList.add("d-none")
    this.showTarget.classList.remove("d-none")
    this._collapse()
  }

  call(event) {
    event.preventDefault()

    const isHidden = this.hideableTarget.classList.contains("d-none")

    if (isHidden) {
      // 👉 On ouvre la sidebar
      this.hideableTarget.classList.remove("d-none")
      this.showTarget.classList.add("d-none")
      this._expand()
    } else {
      // 👉 On ferme la sidebar
      this.hideableTarget.classList.add("d-none")
      this.showTarget.classList.remove("d-none")
      this._collapse()
    }
  }

  _expand() {
    this.sidebarColTarget.classList.remove("col-auto")
    this.sidebarColTarget.classList.add("col-md-3")
    this.mainContentTarget.classList.remove("col")
    this.mainContentTarget.classList.add("col-md-6")
  }

  _collapse() {
    this.sidebarColTarget.classList.remove("col-md-3")
    this.sidebarColTarget.classList.add("col-auto")
    this.mainContentTarget.classList.remove("col-md-6")
    this.mainContentTarget.classList.add("col")
  }
}
