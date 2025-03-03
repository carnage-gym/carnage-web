// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Application } from "@hotwired/stimulus"
import '@hotwired/turbo-rails'

import dialog_controller from "./controllers/dialog_controller"

window.Stimulus = Application.start()
Stimulus.register("dialog", dialog_controller)

