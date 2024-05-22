import { Application } from "@hotwired/stimulus"
import { Alert } from "tailwindcss-stimulus-components"

const application = Application.start()
application.register('alert', Alert)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
