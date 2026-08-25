# frozen_string_literal: true

require "spec_helper"

RSpec.describe AccessibleModalComponent, type: :component do
  it "renders a dialog with required ARIA wiring" do
    render_inline(described_class.new(id: "demo-modal", title: "Confirm action")) do |modal|
      modal.with_body { "Are you sure?" }
    end

    expect(page).to have_css("[role='dialog'][aria-modal='true']")
    expect(page).to have_css("#demo-modal-title", text: "Confirm action")
    expect(page).to have_css("button[aria-label='Close modal']")
    expect(page).to have_text("Are you sure?")
  end

  it "rejects blank titles" do
    expect {
      described_class.new(id: "demo-modal", title: "")
    }.to raise_error(ArgumentError, /Title cannot be blank/)
  end
end
