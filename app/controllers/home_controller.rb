class HomeController < ApplicationController
  def index
    @components = [
      {
        name: "Accessible Button",
        description: "WCAG 2.1 AA button with keyboard navigation and screen reader support",
        class_name: "AccessibleButtonComponent"
      },
      {
        name: "Accessible Modal",
        description: "Focus-trapped modal dialog with ARIA attributes and keyboard controls",
        class_name: "AccessibleModalComponent"
      },
      {
        name: "Accessible Form Field",
        description: "Labelled input with hint text and required-state announcements",
        class_name: "AccessibleFormComponent"
      }
    ]
  end
end
