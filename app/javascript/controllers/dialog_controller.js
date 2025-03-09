import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ['dialog']

  showDialog () {
    const dialog = this.dialogTarget
    dialog.showModal()
  }

  closeDialog () {
    const dialog = this.dialogTarget
    dialog.close()
  }
}
