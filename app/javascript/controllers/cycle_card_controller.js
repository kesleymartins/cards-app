import { Controller } from "@hotwired/stimulus"

export default class CycleCardController extends Controller {
    showAnswer() {
        this.element.querySelector("#answer-block").classList.remove('is-hidden')
    }
}