import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const findFirstCycleButton = this.element.querySelector("#find-first-cycle-button")
        
        findFirstCycleButton.click()
        findFirstCycleButton.remove()
    }
}