import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello world!!")
    setTimeout(() => {this.element.remove() }, 3000)
  }
}
