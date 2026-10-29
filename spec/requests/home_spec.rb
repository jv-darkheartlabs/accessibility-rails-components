require "rails_helper"

RSpec.describe "Health check", type: :request do
  it "returns ok" do
    get "/health"
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)["status"]).to eq("ok")
  end
end

RSpec.describe "Homepage", type: :request do
  it "renders component showcase" do
    get root_path
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Accessible Rails Components")
    expect(response.body).to include("AccessibleButtonComponent")
  end

  it "uses the current portfolio and repository links" do
    get root_path

    expect(response.body).to include('href="https://darkheartlabs.technology"')
    expect(response.body).to include('href="https://github.com/jv-darkheartlabs/accessibility-rails-components"')
    expect(response.body).not_to include("jenthedev.it.com")
    expect(response.body).not_to include("github.com/jen-the-dev/")
  end
end

RSpec.describe AccessibleButtonComponent, type: :component do
  it "renders primary button text" do
    render_inline(described_class.new(text: "Save", variant: "primary"))
    expect(page).to have_button("Save")
  end
end

RSpec.describe "Color-vision teaching preview", type: :request do
  before { get root_path }

  def demo
    @demo ||= Nokogiri::HTML(response.body).at_css("[data-color-vision]")
  end

  it "keeps one shared native dialog outside the compared surfaces" do
    expect(demo.css("dialog").length).to eq(1)
    expect(demo.css(".cv-panels dialog")).to be_empty
    expect(demo.css("[data-cv-open-dialog]").length).to eq(2)
    expect(demo.at_css("dialog")["aria-labelledby"]).to eq("cv-dialog-heading")
  end

  it "provides the agreed default settings and complete simulation choices" do
    expect(demo.css('[data-cv-setting="simulation"]').map { |input| input["value"] })
      .to eq(%w[original protanopia deuteranopia tritanopia])
    expected = { "simulation" => "original", "palette" => "current", "layout" => "comparison", "cues" => "words" }
    expected.each do |setting, value|
      expect(demo.at_css("[data-cv-setting='#{setting}'][checked]")["value"]).to eq(value)
    end
    expect(demo.at_css("[data-cv-single-controls]").key?("hidden")).to be(true)
  end

  it "keeps paired input ids unique, associated with labels, and inside no submitting form" do
    inputs = demo.css("[data-cv-form] input")
    expect(inputs.length).to eq(2)
    expect(inputs.map { |input| input["id"] }.uniq.length).to eq(2)
    inputs.each do |input|
      expect(demo.at_css("label[for='#{input['id']}']")).not_to be_nil
      expect(input.ancestors("form")).to be_empty
    end
    expect(demo.css("[data-cv-announcement][role='status']").length).to eq(1)
  end

  it "offers keyboard scrolling and preserves the original showcase as a closed reference" do
    expect(demo.at_css("[data-cv-scroll]")["tabindex"]).to eq("0")
    document = Nokogiri::HTML(response.body)
    showcase = document.at_css("details.original-showcase")
    expect(showcase.key?("open")).to be(false)
    expect(showcase.at_css("summary").text).to eq("Original component showcase")
    expect(showcase.at_css("#demo-modal")).not_to be_nil
  end

  it "uses explicit linear RGB filters and explains the blue-yellow limitation" do
    expect(demo.css("filter").length).to eq(3)
    demo.css("filter").each do |filter|
      expect(filter["color-interpolation-filters"]).to eq("linearRGB")
      expect(filter.at_css("fecolormatrix")["values"].split.length).to eq(20)
    end
    expect(demo.text).to include("does not exactly reproduce tritanopia")
  end
end
