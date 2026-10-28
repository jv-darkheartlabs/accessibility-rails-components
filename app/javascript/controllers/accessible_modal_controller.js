import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "closeButton"]
  static values = { closable: Boolean, closeOnBackdrop: Boolean }

  connect() {
    this.handleKeydown = this.handleKeydown.bind(this)
  }

  open() {
    this.element.classList.add("is-open")
    this.modalTarget.setAttribute("aria-hidden", "false")
    document.addEventListener("keydown", this.handleKeydown)
    this.modalTarget.focus()
  }

  close() {
    this.element.classList.remove("is-open")
    this.modalTarget.setAttribute("aria-hidden", "true")
    document.removeEventListener("keydown", this.handleKeydown)
  }

  handleBackdropClick(event) {
    if (this.closeOnBackdropValue && event.target === this.element) {
      this.close()
    }
  }

  handleKeydown(event) {
    if (event.key === "Escape" && this.closableValue) {
      this.close()
    }
  }
}
