import { application } from "controllers/application"
import AccessibleButtonController from "controllers/accessible_button_controller"
import AccessibleModalController from "controllers/accessible_modal_controller"

application.register("accessible-button", AccessibleButtonController)
application.register("accessible-modal", AccessibleModalController)
