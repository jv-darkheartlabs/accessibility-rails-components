# Accessible Modal Component
# WCAG 2.1 AA compliant modal with focus trapping and keyboard navigation
class AccessibleModalComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer
  
  attr_reader :id, :title, :size, :closable, :close_on_backdrop, :aria_labelledby, :aria_describedby
  
  SIZES = %w[small medium large fullscreen].freeze
  
  def initialize(
    id:,
    title:,
    size: 'medium',
    closable: true,
    close_on_backdrop: true,
    aria_labelledby: nil,
    aria_describedby: nil,
    **html_attributes
  )
    @id = id
    @title = title
    @size = size
    @closable = closable
    @close_on_backdrop = close_on_backdrop
    @aria_labelledby = aria_labelledby || "#{id}-title"
    @aria_describedby = aria_describedby
    @html_attributes = html_attributes
    
    validate_params!
  end
  
  def call
    content_tag(:div, class: 'modal-backdrop', id: "#{id}-backdrop", 
                'data-controller': 'accessible-modal',
                'data-accessible-modal-closable-value': closable,
                'data-accessible-modal-close-on-backdrop-value': close_on_backdrop,
                'data-action': backdrop_actions) do
      
      content_tag(:div, class: modal_classes, id: id, **modal_attributes) do
        safe_join([
          modal_header,
          modal_body,
          modal_footer
        ].compact)
      end
    end
  end
  
  def trigger_button(text, **button_attributes)
    button_tag(
      text,
      type: 'button',
      'data-action': 'click->accessible-modal#open',
      'aria-haspopup': 'dialog',
      **button_attributes
    )
  end
  
  private
  
  def modal_attributes
    {
      role: 'dialog',
      'aria-modal': 'true',
      'aria-labelledby': aria_labelledby,
      'aria-describedby': aria_describedby,
      'aria-hidden': 'true',
      tabindex: '-1',
      'data-accessible-modal-target': 'modal',
      **@html_attributes
    }.compact
  end
  
  def modal_classes
    classes = ['modal', 'accessible-modal']
    classes << "modal--#{size}"
    classes.join(' ')
  end
  
  def backdrop_actions
    actions = []
    actions << 'click->accessible-modal#handleBackdropClick' if close_on_backdrop
    actions << 'keydown->accessible-modal#handleKeydown'
    actions.join(' ')
  end
  
  def modal_header
    return unless title.present? || header?
    
    content_tag(:div, class: 'modal__header') do
      header_content = if header?
        header
      else
        content_tag(:h2, title, class: 'modal__title', id: aria_labelledby)
      end
      
      if closable
        safe_join([
          header_content,
          close_button
        ])
      else
        header_content
      end
    end
  end
  
  def modal_body
    return unless body?
    
    content_tag(:div, class: 'modal__body', id: aria_describedby) do
      body
    end
  end
  
  def modal_footer
    return unless footer?
    
    content_tag(:div, class: 'modal__footer') do
      footer
    end
  end
  
  def close_button
    button_tag(
      '×',
      type: 'button',
      class: 'modal__close',
      'aria-label': 'Close modal',
      'data-action': 'click->accessible-modal#close',
      'data-accessible-modal-target': 'closeButton'
    )
  end
  
  def validate_params!
    raise ArgumentError, "Invalid size: #{size}" unless SIZES.include?(size)
    raise ArgumentError, "ID cannot be blank" if id.blank?
    raise ArgumentError, "Title cannot be blank" if title.blank?
  end
end