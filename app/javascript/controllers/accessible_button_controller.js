import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  handleClick(event) {
    if (this.element.disabled) {
      event.preventDefault()
    }
  }

  handleKeydown(event) {
    if (event.key === "Enter" || event.key === " ") {
      event.preventDefault()
      this.element.click()
    }
  }
}
