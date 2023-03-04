import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["navburger", "navmenu"]
    
    connect() {
        console.log('conectado');

        this.navburgerTarget.addEventListener('click', () => {
            this.navburgerTarget.classList.toggle('is-active')
            this.navmenuTarget.classList.toggle('is-active')
        }) 
    }
}