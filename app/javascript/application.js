// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import('preline');
import Alpine from "alpinejs"

window.Alpine = Alpine

Alpine.start()

document.addEventListener("turbo:load", function(event) {
  HSAccordion.autoInit();
  HSDropdown.autoInit();
  HSOverlay.autoInit();
  HSSelect.autoInit();
});

document.addEventListener("turbo:frame-load", function(event) {
  HSStaticMethods.autoInit();
});
