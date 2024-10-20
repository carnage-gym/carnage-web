import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  show() {
    const dialog = this.modalTarget;
    dialog.showModal();
  }

  close() {
    const dialog = this.modalTarget;
    dialog.close();
  }
}
