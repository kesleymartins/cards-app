import { Controller } from "@hotwired/stimulus"

export default class CycleCardController extends Controller {
    showAwser() {
        this.element.querySelector("#awser-block").classList.remove('is-hidden')
    }
}