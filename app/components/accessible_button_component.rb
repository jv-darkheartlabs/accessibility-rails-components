# Accessible Button Component
# WCAG 2.1 AA compliant button with keyboard navigation and screen reader support
class AccessibleButtonComponent < ViewComponent::Base
  attr_reader :text, :variant, :size, :disabled, :type, :aria_label, :aria_describedby
  
  VARIANTS = %w[primary secondary danger success warning].freeze
  SIZES = %w[small medium large].freeze
  TYPES = %w[button submit reset].freeze
  
  def initialize(
    text:,
    variant: 'primary',
    size: 'medium',
    disabled: false,
    type: 'button',
    aria_label: nil,
    aria_describedby: nil,
    **html_attributes
  )
    @text = text
    @variant = variant
    @size = size
    @disabled = disabled
    @type = type
    @aria_label = aria_label || text
    @aria_describedby = aria_describedby
    @html_attributes = html_attributes
    
    validate_params!
  end
  
  def call
    button_tag(
      content,
      **button_attributes
    )
  end
  
  private
  
  def content
    content_tag(:span, text, class: 'button__text', 'aria-hidden': false)
  end
  
  def button_attributes
    base_attributes = {
      type: type,
      disabled: disabled,
      class: css_classes,
      'aria-label': aria_label,
      'aria-describedby': aria_describedby,
      'aria-disabled': disabled.to_s,
      'data-testid': "accessible-button-#{variant}",
      'data-controller': 'accessible-button',
      'data-action': 'click->accessible-button#handleClick keydown->accessible-button#handleKeydown'
    }
    
    # Remove nil values
    base_attributes.compact!
    
    # Merge with additional HTML attributes
    base_attributes.merge(@html_attributes)
  end
  
  def css_classes
    classes = ['btn', 'accessible-btn']
    classes << "btn--#{variant}"
    classes << "btn--#{size}"
    classes << 'btn--disabled' if disabled
    classes.join(' ')
  end
  
  def validate_params!
    raise ArgumentError, "Invalid variant: #{variant}" unless VARIANTS.include?(variant)
    raise ArgumentError, "Invalid size: #{size}" unless SIZES.include?(size)
    raise ArgumentError, "Invalid type: #{type}" unless TYPES.include?(type)
    raise ArgumentError, "Text cannot be blank" if text.blank?
  end
end