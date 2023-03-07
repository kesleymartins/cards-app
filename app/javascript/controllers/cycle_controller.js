import { Controller } from "@hotwired/stimulus"

export default class CycleController extends Controller {
    connect() {
        const showCardButton = this.element.querySelector('#show-card-button')
        const cardAnswerBlock = this.element.querySelector('#card-answer-block')
        const cycleActions = this.element.querySelector('#cycle-actions')

        showCardButton.addEventListener('click', () => {
            showCardButton.remove()
            
            this.display(cardAnswerBlock)
            this.display(cycleActions)

            this.setupCycleActions(cycleActions)
        })
    }

    display(element) {
        element.classList.remove('is-hidden')
    }

    setupCycleActions(cycleActions) {
        const nextCycleAction = this.element.querySelector('#next-cycle-button')
        
        cycleActions.querySelectorAll('input.button').forEach(element => {
            element.addEventListener('click', () => {
                cycleActions.classList.add('is-hidden')
                this.display(nextCycleAction)
            })
        });
    }
}