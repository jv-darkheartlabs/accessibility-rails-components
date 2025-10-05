class ApplicationController < ActionController::Base
  # CSRF protection for forms
  protect_from_forgery with: :exception
  
  # Set security headers for accessibility
  before_action :set_accessibility_headers
  
  private
  
  def set_accessibility_headers
    # Ensure proper content type for screen readers
    response.headers['Content-Type'] = 'text/html; charset=utf-8'
    
    # CSP headers that don't interfere with assistive technologies
    response.headers['Content-Security-Policy'] = "default-src 'self' 'unsafe-inline' 'unsafe-eval'"
  end
  
  def render_success(data, message: 'Success', status: :ok)
    render json: {
      success: true,
      message: message,
      data: data,
      timestamp: Time.current.iso8601
    }, status: status
  end
  
  def render_error(message, status: :bad_request, details: nil)
    error_response = {
      success: false,
      error: message,
      status: Rack::Utils::SYMBOL_TO_STATUS_CODE[status],
      timestamp: Time.current.iso8601
    }
    
    error_response[:details] = details if details
    
    render json: error_response, status: status
  end
end