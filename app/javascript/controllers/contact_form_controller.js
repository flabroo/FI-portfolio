import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contact-form"
export default class extends Controller {
  static targets = ["form", "alert"]
  connect() {
    console.log("Hello from contact controller");
  }

  send(e) {
    e.preventDefault()
    console.log("running send");
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log('Success:', data)
        this.alertTarget.innerHTML = ""
        if (data.form){
          this.formTarget.outerHTML = data.form
        }
        this.alertTarget.innerHTML = data.alert
      })
  }
}
