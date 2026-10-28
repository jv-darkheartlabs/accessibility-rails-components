class HealthController < ApplicationController
  skip_forgery_protection

  def show
    render json: {
      status: "ok",
      app: "Accessibility Rails Components",
      wcag_level: "AA",
      timezone: "Pacific/Auckland"
    }
  end
end
