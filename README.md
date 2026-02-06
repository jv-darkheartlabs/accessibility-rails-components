# Accessible Rails Components Library

> **Empowering inclusive web development** - A comprehensive library of Rails view components built with accessibility-first design principles, ensuring web applications are usable by everyone.

[![Rails Version](https://img.shields.io/badge/Rails-7.x-red.svg)](https://rubyonrails.org/)
[![Ruby Version](https://img.shields.io/badge/Ruby-3.x-red.svg)](https://www.ruby-lang.org/)
[![WCAG Compliance](https://img.shields.io/badge/WCAG-2.1%20AA-green.svg)](https://www.w3.org/WAI/WCAG21/quickref/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## 🌟 Impact Statement

This project stems from **13+ years of community leadership with Girls Who Code** and a deep commitment to making technology accessible to everyone. By providing production-ready accessible components, we're removing barriers for developers to create inclusive web applications while ensuring people with disabilities can fully participate in the digital world.

**Perfect for New Zealand's inclusive tech culture** - supporting accessibility standards and cultural diversity including Te Reo Māori language support.

---

## 🚀 Live Demo

- **Try it in GitHub Codespaces (recommended):** https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=1070341212
- **Component previews:** `/rails/view_components` (once the server is running)

---

## 🧪 Demo Samples

- `samples/demo-checklist.md` – quick walkthrough script
- `samples/requests.http` – URLs to hit during a demo

---

## ✨ Key Features

- **🔍 Screen Reader Optimized** - Full NVDA, JAWS, and VoiceOver support
- **⌨️ Keyboard Navigation** - Complete keyboard accessibility with logical tab order
- **🎨 High Contrast Support** - Color-blind friendly with WCAG AA contrast ratios
- **🌏 Multi-language Ready** - English, Te Reo Māori, and Pacific language support
- **📱 Mobile Accessible** - Touch-friendly with proper focus management
- **🧪 Thoroughly Tested** - Automated accessibility testing with axe-core

---

## 🛠️ Tech Stack

- **Ruby on Rails 7.1+** - Modern Rails with ViewComponent architecture
- **Stimulus** - Progressive enhancement for JavaScript interactions
- **TailwindCSS** - Utility-first styling with accessibility utilities
- **ViewComponent** - Encapsulated, testable view components
- **RSpec** - Comprehensive testing including accessibility tests
- **axe-core** - Automated accessibility testing integration

---

## 📋 Accessibility Features

### **WCAG 2.1 AA Compliance**
- Semantic HTML structure with proper heading hierarchy
- ARIA attributes for enhanced screen reader support
- Color contrast ratios meeting 4.5:1 minimum standard
- Focus management for dynamic content

### **Keyboard Navigation**
- Full keyboard accessibility without mouse dependency
- Logical tab order through all interactive elements
- Escape key handling for modal dialogs and dropdowns
- Arrow key navigation for complex components

### **Screen Reader Support**
- Descriptive alt text for all images and icons
- Screen reader-specific content for context
- Proper form labels and error associations
- Live regions for dynamic content announcements

### **Motor Accessibility**
- Large touch targets (minimum 44x44px)
- Sufficient spacing between interactive elements
- Support for voice control and switch navigation
- Reduced motion preferences respected

---

## 🎯 Available Components

### **Form Components**
- `AccessibleFormComponent` - Semantic forms with error handling
- `AccessibleInputComponent` - Text inputs with proper labeling
- `AccessibleSelectComponent` - Dropdown menus with keyboard support
- `AccessibleRadioGroupComponent` - Radio button groups with fieldsets
- `AccessibleCheckboxComponent` - Checkboxes with clear states

### **Navigation Components**
- `AccessibleNavigationComponent` - Site navigation with skip links
- `AccessibleBreadcrumbComponent` - Breadcrumb navigation
- `AccessibleTabsComponent` - Tab panels with ARIA support
- `AccessibleMenuComponent` - Dropdown menus with keyboard navigation

### **Content Components**
- `AccessibleModalComponent` - Modal dialogs with focus trapping
- `AccessibleTableComponent` - Data tables with sorting and filtering
- `AccessibleCardComponent` - Content cards with proper structure
- `AccessibleAlertComponent` - Notifications and alerts
- `AccessibleTooltipComponent` - Contextual help and information

### **Data Visualization**
- `AccessibleChartComponent` - Charts with text alternatives
- `AccessibleProgressComponent` - Progress indicators with announcements
- `AccessibleAccordionComponent` - Collapsible content sections

---

## 🚀 Getting Started

### **Prerequisites**
- Ruby 3.0+
- Rails 7.0+
- Node.js 16+ (for Stimulus and TailwindCSS)

### **Installation**

#### **Option 1: Add to Existing Rails App**
```bash
# Add to your Gemfile
gem 'accessibility_rails_components', git: 'https://github.com/arcaneglam/accessibility-rails-components.git'

# Install the gem
bundle install

# Run the generator to install components
rails generate accessibility_rails_components:install
```

#### **Option 2: Clone and Explore**
```bash
git clone https://github.com/arcaneglam/accessibility-rails-components.git
cd accessibility-rails-components
bundle install
yarn install
rails db:create db:migrate
rails server
```

---

## 📖 Documentation

- **[Component Documentation](docs/components.md)** - Detailed API and usage examples
- **[Accessibility Guidelines](docs/accessibility.md)** - WCAG compliance and best practices  
- **[Styling Guide](docs/styling.md)** - Customization and theming
- **[Testing Guide](docs/testing.md)** - Writing and running accessibility tests
- **[Deployment Guide](docs/deployment.md)** - Production deployment considerations

---

## 📞 Support & Contact

- **Issues & Bugs**: https://github.com/arcaneglam/accessibility-rails-components/issues
- **Discussions**: https://github.com/arcaneglam/accessibility-rails-components/discussions

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with ❤️ for an accessible web by [Jennifer Picado](https://linkedin.com/in/jennifer-picado)**
