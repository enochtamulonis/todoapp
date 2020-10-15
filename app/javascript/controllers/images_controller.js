import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ["displayedPicture", "picture"]
  connect () {
    super.connect()
  }

  showUploadedPicture(event) {
    console.log("u uploaded a pic");
    let uploaded_picture = event.srcElement.files[0];
    this.displayedPictureTarget.innerHTML = "picture"
    this.displayedPictureTarget.classList.toggle("hidden")
    console.log(uploaded_picture);
  }

}
