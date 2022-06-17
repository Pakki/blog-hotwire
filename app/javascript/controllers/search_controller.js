import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("search controller connected");
    //this.element.textContent = "Hello World!";
  }
  static targets = ["form"];

  search() {
    const search_phrase = document.getElementById("search_phrase").value;
    if (search_phrase.length > 3) {
      this.formTarget.requestSubmit();
    }
  }
}
