# WCAG 2.1 AA form field group with associated labels
class AccessibleFormComponent < ViewComponent::Base
  attr_reader :label, :name, :type, :required, :hint, :value

  def initialize(label:, name:, type: "text", required: false, hint: nil, value: nil)
    @label = label
    @name = name
    @type = type
    @required = required
    @hint = hint
    @value = value
  end

  def call
    content_tag(:div, class: "form-field") do
      safe_join([
        label_tag(field_id, label_text, class: "form-field__label"),
        hint_element,
        tag.input(
          type: type,
          name: name,
          id: field_id,
          value: value,
          required: required,
          class: "form-field__input",
          "aria-describedby": hint_id,
          "aria-required": required
        )
      ].compact)
    end
  end

  private

  def field_id
    @field_id ||= "field-#{name.to_s.parameterize}"
  end

  def hint_id
    @hint_id ||= "#{field_id}-hint" if hint.present?
  end

  def label_text
    required ? "#{label} (required)" : label
  end

  def hint_element
    return unless hint.present?

    content_tag(:p, hint, id: hint_id, class: "form-field__hint")
  end
end
