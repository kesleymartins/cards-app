import { Controller } from "@hotwired/stimulus"

export default class CycleCardController extends Controller {
    static targets = ["button", "answerBlock"]
    
    connect() {
        this.buttonTarget.addEventListener('click', () => {
            this.showAnswer()
            this.removeShowAnswerButton()
        })
    }
    
    showAnswer() {
        this.answerBlockTarget.classList.remove('is-hidden')
    }

    removeShowAnswerButton() {
        this.buttonTarget.remove();
    }
}