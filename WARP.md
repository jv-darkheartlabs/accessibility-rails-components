# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is the **Accessible Rails Components Library** - a comprehensive collection of Rails ViewComponents built with accessibility-first design principles. The project ensures WCAG 2.1 AA compliance while providing production-ready components for inclusive web development.

**Current Status**: This appears to be a planned architecture repository containing documentation but requires Rails application structure generation.

## Quick Start

### GitHub Codespaces (Recommended)
**One-click accessibility-first development environment:**

1. **Open in Codespaces**: Click "Code" > "Codespaces" > "Create codespace on main"
2. **Automatic setup**: The `.devcontainer` will automatically:
   - Set up Ruby 3.2.0 + Rails 7.1 environment
   - Launch PostgreSQL 15 for production-ready database
   - Install all gems including accessibility testing tools
   - Set up Node.js, npm, and build tools
   - Configure VS Code with accessibility extensions
   - Install axe-core CLI for accessibility auditing
3. **Start developing**: 
   - Main app: `https://[codespace-name]-3000.app.github.dev`
   - ViewComponent previews: `https://[codespace-name]-3000.app.github.dev/rails/view_components`

```bash
# Once Codespace is ready:
bundle exec rails server -b 0.0.0.0         # Start main server
axe http://localhost:3000                    # Run accessibility audit
```

### Local Development (Alternative)
- Ruby 3.2+
- Rails 7.1+
- Node.js 16+ (for Stimulus and TailwindCSS)
- PostgreSQL 15+

```bash
# Install dependencies
bundle install
npm install

# Setup database
rails db:create
rails db:migrate

# Start development server
rails server
```

### Component Development Setup
```bash
# Generate a new accessible component
rails generate component AccessibleButton title:string variant:string --preview

# Run accessibility tests
bundle exec rspec spec/accessibility/

# Start development server with component previews
rails server
# Visit http://localhost:3000/rails/view_components
```

## Architecture Overview

### Tech Stack
- **Rails 7.1** - Modern Rails with ViewComponent architecture
- **ViewComponent 3.0** - Encapsulated, testable view components
- **Stimulus** - Progressive enhancement for JavaScript interactions
- **TailwindCSS** - Utility-first CSS framework with accessibility utilities
- **RSpec** - Testing framework with accessibility test extensions
- **axe-core-rspec** - Automated accessibility testing integration

### Core Technologies

#### Component Architecture
- **ViewComponent** for Ruby-based component classes
- **Stimulus controllers** for progressive JavaScript enhancement
- **TailwindCSS** for utility-based styling with accessibility features
- **Preview system** for component development and testing

#### Accessibility Stack
- **axe-core-rspec** for automated WCAG compliance testing
- **Semantic HTML** structure with proper ARIA attributes
- **Keyboard navigation** support across all components
- **Screen reader optimization** with descriptive labels and live regions

#### Testing & Quality
- **RSpec** for unit and integration testing
- **Capybara** for browser-based testing
- **StandardRB** for code formatting and linting
- **Factory Bot** for test data generation

## Development Commands

### GitHub Codespaces Commands
```bash
# Server management
bundle exec rails server -b 0.0.0.0        # Start Rails server (accessible externally)

# Component development
rails generate component AccessibleCard title:string --preview
open https://$(echo $CODESPACE_NAME)-3000.app.github.dev/rails/view_components

# Accessibility testing
axe https://$(echo $CODESPACE_NAME)-3000.app.github.dev
axe https://$(echo $CODESPACE_NAME)-3000.app.github.dev/rails/view_components
bundle exec rspec spec/accessibility/

# Database operations
rails db:migrate
rails console

# Code quality
bundle exec standard
bundle exec rspec
```

### Local Development Setup
```bash
bundle install                    # Install Ruby dependencies
npm install                      # Install JavaScript dependencies  
rails db:create db:migrate       # Setup database
```

### Component Development
```bash
# Generate new component with preview
rails generate component AccessibleCard title:string --preview

# View component previews
rails server
# Navigate to http://localhost:3000/rails/view_components

# Generate component documentation
rails generate component_docs
```

### Testing & Quality Assurance
```bash
# Run all tests
bundle exec rspec

# Run accessibility tests specifically
bundle exec rspec spec/accessibility/

# Run automated accessibility audit
rails accessibility:audit

# Code formatting and linting
bundle exec standardrb
bundle exec standardrb --fix      # Auto-fix issues
```

### Accessibility Testing
```bash
# Manual accessibility testing checklist
rails test:accessibility:manual

# Generate accessibility report
rails accessibility:report

# Test specific component accessibility
bundle exec rspec spec/components/accessible_button_component_spec.rb
```

### Development Server
```bash
rails server                      # Start development server
rails server -p 4000             # Start on custom port
```

## Accessibility Testing Strategy

### Automated Testing
- **axe-core integration** for WCAG compliance verification
- **Keyboard navigation tests** ensuring full keyboard accessibility
- **Screen reader tests** validating ARIA attributes and semantic structure
- **Color contrast validation** meeting WCAG AA standards

### Manual Testing Checklist
1. **Keyboard Navigation**
   - Tab through all interactive elements
   - Test arrow key navigation for complex components
   - Verify escape key handling for modals/dropdowns
   - Confirm logical tab order

2. **Screen Reader Testing**
   - Test with VoiceOver (macOS) or NVDA (Windows)
   - Verify all content is announced appropriately
   - Check form labels and error associations
   - Test live region announcements

3. **Visual Testing**
   - Verify color contrast ratios ≥ 4.5:1
   - Test with 200% zoom level
   - Check focus indicators are visible
   - Test with high contrast mode

### Accessibility Test Examples
```ruby
# Component accessibility test
RSpec.describe AccessibleButtonComponent, type: :component do
  it "meets WCAG accessibility standards" do
    render_inline(described_class.new(title: "Submit"))
    
    expect(page).to be_axe_clean
    expect(page).to have_button("Submit")
    expect(page).to have_css("[role='button']")
  end
end
```

## Component Development Patterns

### ViewComponent Structure
```ruby
# app/components/accessible_button_component.rb
class AccessibleButtonComponent < ViewComponent::Base
  attr_reader :title, :variant, :disabled

  def initialize(title:, variant: :primary, disabled: false, **html_options)
    @title = title
    @variant = variant
    @disabled = disabled
    @html_options = html_options
  end

  private

  def css_classes
    base_classes = "btn focus:ring-2 focus:ring-offset-2"
    variant_classes = {
      primary: "bg-blue-600 text-white hover:bg-blue-700",
      secondary: "bg-gray-600 text-white hover:bg-gray-700"
    }
    
    [base_classes, variant_classes[@variant]].join(" ")
  end
end
```

### Stimulus Controller Pattern
```javascript
// app/javascript/controllers/accessible_modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "closeButton", "firstFocusable", "lastFocusable"]

  connect() {
    this.trapFocus = this.trapFocus.bind(this)
  }

  open() {
    this.modalTarget.classList.remove("hidden")
    this.firstFocusableTarget.focus()
    document.addEventListener("keydown", this.trapFocus)
  }

  close() {
    this.modalTarget.classList.add("hidden")
    document.removeEventListener("keydown", this.trapFocus)
  }

  trapFocus(event) {
    if (event.key === "Tab") {
      // Implement focus trapping logic
    }
    if (event.key === "Escape") {
      this.close()
    }
  }
}
```

## Key Architectural Patterns

### Component Organization
```
app/components/
├── accessible_button_component.rb
├── accessible_button_component.html.erb
├── accessible_form_component.rb
├── accessible_form_component.html.erb
├── accessible_modal_component.rb
└── accessible_modal_component.html.erb

app/javascript/controllers/
├── accessible_modal_controller.js
├── accessible_dropdown_controller.js
└── accessible_tabs_controller.js
```

### Testing Structure
```
spec/
├── components/
│   ├── accessible_button_component_spec.rb
│   └── accessible_form_component_spec.rb
├── accessibility/
│   ├── keyboard_navigation_spec.rb
│   └── screen_reader_spec.rb
└── system/
    └── component_integration_spec.rb
```

## Troubleshooting

### Common Issues

#### Accessibility Test Failures
```bash
# Check axe-core violations
bundle exec rspec --format documentation

# Debug specific accessibility issues
rails console
> component = AccessibleButtonComponent.new(title: "Test")
> render_inline(component)
```

#### ViewComponent Issues
```bash
# Clear ViewComponent cache
rm -rf tmp/view_component_cache

# Regenerate component previews
rails generate component:previews
```

#### Stimulus Controller Issues
```bash
# Check JavaScript console for errors
# Verify controller is properly registered
# Check data-controller attributes in templates
```

### Performance Optimization
- Use ViewComponent's fragment caching for complex components
- Optimize TailwindCSS build for production
- Lazy load non-critical Stimulus controllers
- Minimize accessibility testing overhead in development

## Component Development Workflow

### Creating New Components
1. **Generate component**: `rails generate component AccessibleComponentName`
2. **Implement accessibility features**: Semantic HTML, ARIA attributes, keyboard support
3. **Add Stimulus controller** (if JavaScript needed): Progressive enhancement patterns
4. **Write comprehensive tests**: Unit, integration, and accessibility tests
5. **Create component preview**: For development and documentation
6. **Document usage**: API documentation and examples

### Testing Workflow
1. **Write failing tests** for new functionality
2. **Implement component** to pass tests
3. **Run accessibility audit** to ensure WCAG compliance
4. **Manual accessibility testing** with keyboard and screen reader
5. **Performance testing** for render times and bundle size

## Future Development Notes

### Component Priorities
- **Form components**: Input, Select, Radio, Checkbox groups
- **Navigation components**: Breadcrumbs, Tabs, Skip links
- **Content components**: Modal, Alert, Tooltip, Card
- **Data components**: Table, Chart, Progress indicators

### Integration Features
- **I18n support**: Te Reo Māori and Pacific language localization
- **Theme system**: Customizable design tokens and CSS variables
- **Component generator**: CLI tool for rapid component scaffolding
- **Documentation site**: Interactive component library and usage guides

---

**Note**: This project prioritizes accessibility compliance and inclusive design. All components must meet WCAG 2.1 AA standards and provide excellent user experiences for people using assistive technologies.