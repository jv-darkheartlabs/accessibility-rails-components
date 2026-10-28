# Accessible Modal Component
class AccessibleModalComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  attr_reader :id, :title, :size, :closable, :close_on_backdrop, :aria_labelledby, :aria_describedby, :trigger_text

  SIZES = %w[small medium large fullscreen].freeze

  def initialize(
    id:,
    title:,
    size: "medium",
    closable: true,
    close_on_backdrop: true,
    aria_labelledby: nil,
    aria_describedby: nil,
    trigger_text: nil,
    **html_attributes
  )
    @id = id
    @title = title
    @size = size
    @closable = closable
    @close_on_backdrop = close_on_backdrop
    @aria_labelledby = aria_labelledby || "#{id}-title"
    @aria_describedby = aria_describedby
    @trigger_text = trigger_text
    @html_attributes = html_attributes

    validate_params!
  end

  def call
    content_tag(:div, class: "modal-component") do
      safe_join([
        trigger_text.present? ? trigger_button(trigger_text) : nil,
        modal_backdrop
      ].compact)
    end
  end

  def trigger_button(text, **button_attributes)
    button_tag(
      text,
      type: "button",
      class: "btn btn--secondary",
      "data-modal-open": id,
      "aria-haspopup": "dialog",
      **button_attributes
    )
  end

  private

  def modal_backdrop
    content_tag(:div, class: "modal-backdrop", id: "#{id}-backdrop") do
      content_tag(:div, class: modal_classes, id: id, **modal_attributes) do
        safe_join([modal_header, modal_body, modal_footer].compact)
      end
    end
  end

  def modal_attributes
    {
      role: "dialog",
      "aria-modal": "true",
      "aria-labelledby": aria_labelledby,
      "aria-describedby": aria_describedby,
      "aria-hidden": "true",
      tabindex: "-1",
      **@html_attributes
    }.compact
  end

  def modal_classes
    ["modal", "accessible-modal", "modal--#{size}"].join(" ")
  end

  def modal_header
    return unless title.present? || header?

    content_tag(:div, class: "modal__header") do
      header_content = header? ? header : content_tag(:h2, title, class: "modal__title", id: aria_labelledby)
      closable ? safe_join([header_content, close_button]) : header_content
    end
  end

  def modal_body
    return unless body?

    content_tag(:div, class: "modal__body", id: aria_describedby) { body }
  end

  def modal_footer
    return unless footer?

    content_tag(:div, class: "modal__footer") { footer }
  end

  def close_button
    button_tag(
      "×",
      type: "button",
      class: "modal__close",
      "aria-label": "Close modal",
      "data-modal-close": id
    )
  end

  def validate_params!
    raise ArgumentError, "Invalid size: #{size}" unless SIZES.include?(size)
    raise ArgumentError, "ID cannot be blank" if id.blank?
    raise ArgumentError, "Title cannot be blank" if title.blank?
  end
end
