# ♿ Accessibility Rails Components Library - GitHub Codespaces

## One-Click Accessible Development Environment

This repository is configured with **GitHub Codespaces** for instant, accessibility-first development. All tools included!

### 🚀 Quick Start

1. **Click the green "Code" button** above
2. **Select "Codespaces"** tab  
3. **Click "Create codespace on main"**
4. **Wait for automatic setup** (2-3 minutes)
5. **Start building accessible components!**

### 🏗️ What Gets Set Up Automatically

- **Ruby 3.2.0** with Rails 7.1 and ViewComponent
- **PostgreSQL 15** for production-ready database
- **Node.js 18** with npm for JavaScript tooling
- **TailwindCSS** with accessibility utilities
- **axe-core CLI** for automated accessibility testing
- **VS Code extensions** including accessibility linters
- **All Ruby gems** including RSpec and testing tools

### 🌐 Your Component Library URLs

Once the Codespace starts, access your components at:
- **Main App**: `https://[your-codespace-name]-3000.app.github.dev`
- **Component Previews**: `https://[your-codespace-name]-3000.app.github.dev/rails/view_components`
- **Component Documentation**: Interactive component library

### ♿ Accessibility Features Built-In

- **WCAG 2.1 AA Compliance**: All components meet accessibility standards
- **Screen Reader Support**: Semantic HTML with proper ARIA attributes
- **Keyboard Navigation**: Full keyboard accessibility
- **axe-core Integration**: Automated accessibility testing
- **High Contrast Themes**: Visual accessibility support

### 🛠️ Common Development Commands

```bash
# Start the Rails server
bundle exec rails server -b 0.0.0.0

# Generate a new accessible component
rails generate component AccessibleCard title:string --preview

# Run accessibility audit
axe http://localhost:3000

# Run accessibility tests
bundle exec rspec spec/accessibility/

# View component previews
open http://localhost:3000/rails/view_components
```

### 🧪 Accessibility Testing Workflow

```bash
# Run all tests including accessibility
bundle exec rspec

# Test specific component accessibility
bundle exec rspec spec/components/accessible_button_component_spec.rb

# Manual accessibility audit
axe https://[codespace-name]-3000.app.github.dev/rails/view_components

# Keyboard navigation testing
# Use Tab, Arrow keys, Enter, Escape in the browser
```

### 💰 Cost Efficiency Benefits

**GitHub Codespaces** provides:
- **Free tier**: 60 hours/month for personal accounts
- **On-demand development**: No always-on server costs
- **Full development environment**: No local setup needed
- **Instant employer demos**: Share live component library

### 🏆 Immigration Portfolio Benefits

This setup demonstrates:
- **Accessibility expertise**: WCAG compliance and inclusive design
- **Modern Rails patterns**: ViewComponent architecture
- **Testing best practices**: Automated accessibility testing
- **Progressive enhancement**: Stimulus-based JavaScript

### 📞 Employer Demonstration

Share your component library directly with potential employers:
- **Live components**: `https://[your-codespace-name]-3000.app.github.dev/rails/view_components`
- **Accessibility audit**: Run axe-core tests in real-time
- **Interactive demos**: Show keyboard navigation and screen reader support

### 🌟 Component Development Features

- **Live component previews** as you develop
- **Hot reloading** with Rails development server
- **Accessibility testing** integrated into development workflow
- **TailwindCSS** with accessibility-focused utilities
- **VS Code extensions** for accessibility linting

---

**♿ Ready to showcase world-class accessible component development with zero setup time!**