import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
  }

  clearForm() {
    this.element.reset()
    this.element.querySelector('input[type="submit"]').disabled = false
  }
}
