import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dialog"];

  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  show() {
    console.log("been triggered");
    const dialog = this.dialogTarget;
    dialog.showModal();
  }
}
