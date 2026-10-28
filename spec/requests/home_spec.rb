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
