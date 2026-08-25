# frozen_string_literal: true

require "spec_helper"

RSpec.describe AccessibleButtonComponent, type: :component do
  it "renders a button with an accessible name" do
    render_inline(described_class.new(text: "Save changes"))

    expect(page).to have_css("button[type='button']", text: "Save changes")
    expect(page).to have_css("[aria-label='Save changes']")
    expect(page).to have_css("[data-testid='accessible-button-primary']")
  end

  it "exposes disabled state to assistive tech" do
    render_inline(described_class.new(text: "Submit", disabled: true))

    expect(page).to have_css("button[disabled]")
    expect(page).to have_css("[aria-disabled='true']")
  end

  it "rejects invalid variants" do
    expect {
      described_class.new(text: "Save", variant: "invalid")
    }.to raise_error(ArgumentError, /Invalid variant/)
  end
end
