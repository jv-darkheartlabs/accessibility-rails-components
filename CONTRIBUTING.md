# Contributing to Accessible Rails Components

Thank you for your interest in contributing! This project is committed to creating an inclusive, welcoming environment for all contributors, regardless of experience level, background, or identity.

## 🌟 Our Values

- **Accessibility First**: Every contribution should maintain or improve accessibility
- **Inclusive Design**: We welcome diverse perspectives and experiences
- **Quality Over Quantity**: Well-tested, documented code over quick fixes
- **Learning Environment**: We support contributors at all skill levels

## 🤝 Ways to Contribute

### **Code Contributions**
- New accessible components
- Bug fixes and improvements  
- Performance optimizations
- Test coverage improvements

### **Accessibility Expertise**
- Manual accessibility testing
- Screen reader testing
- Keyboard navigation testing
- WCAG compliance audits

### **Documentation**
- API documentation
- Usage examples
- Accessibility guides
- Translation support

### **Community Support**
- Answering questions in issues/discussions
- Code reviews
- Mentoring new contributors

## 🚀 Getting Started

### **Development Setup**
```bash
# Clone the repository
git clone https://github.com/forestbloomglitch/accessibility-rails-components.git
cd accessibility-rails-components

# Install dependencies
bundle install
yarn install

# Set up the database
rails db:create db:migrate

# Run the test suite
bundle exec rspec

# Start the development server
rails server
```

### **Testing Your Changes**
```bash
# Run all tests
bundle exec rspec

# Run accessibility tests specifically
bundle exec rspec spec/accessibility/

# Run linting
bundle exec standardrb

# Test accessibility manually
rails server
# Navigate to http://localhost:3000 and test with screen reader
```

## 📋 Contribution Guidelines

### **Before You Start**
1. Check existing issues to see if your idea is already being discussed
2. Open an issue to discuss major changes before implementing
3. Fork the repository and create a feature branch

### **Code Standards**
- Follow Ruby and Rails conventions
- Use StandardRB for code formatting
- Write comprehensive tests (aim for >90% coverage)
- Include accessibility tests for new components
- Document all public APIs

### **Accessibility Requirements**
All contributions must maintain WCAG 2.1 AA compliance:
- Semantic HTML structure
- Proper ARIA attributes
- Keyboard navigation support
- Screen reader compatibility
- Color contrast ratios ≥ 4.5:1
- Focus management

### **Component Development**
New components should include:
- Ruby component class using ViewComponent
- Stimulus controller if JavaScript is needed
- Comprehensive test suite
- Usage documentation
- Accessibility documentation

## 🧪 Testing Guidelines

### **Required Tests**
- Unit tests for component logic
- Integration tests for user interactions
- Accessibility tests with axe-core
- Visual regression tests for styling

### **Accessibility Testing**
```ruby
# Example accessibility test
require 'rails_helper'

RSpec.describe AccessibleFormComponent, type: :component do
  it 'meets WCAG accessibility standards' do
    render_inline(described_class.new)
    
    expect(page).to be_axe_clean
    expect(page).to have_proper_heading_structure
    expect(page).to have_keyboard_navigation
  end
end
```

## 📝 Pull Request Process

### **PR Checklist**
- [ ] Tests pass (`bundle exec rspec`)
- [ ] Code is formatted (`bundle exec standardrb`)
- [ ] Accessibility tests included and passing
- [ ] Documentation updated
- [ ] CHANGELOG.md updated (for significant changes)

### **PR Description Template**
```markdown
## Description
Brief description of changes and motivation

## Type of Change
- [ ] Bug fix
- [ ] New component
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Manual testing completed
- [ ] Automated tests pass
- [ ] Accessibility testing completed
- [ ] Screen reader testing completed

## Screenshots/Demo
[Include screenshots or GIF demos for UI changes]

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed  
- [ ] Documentation updated
- [ ] Tests added/updated
```

## 🔍 Code Review Process

### **What We Look For**
- Accessibility compliance
- Code quality and maintainability
- Comprehensive testing
- Clear documentation
- Performance considerations

### **Review Timeline**
- Initial review within 3 business days
- Follow-up reviews within 1 business day
- We aim to merge approved PRs quickly

## 🚨 Reporting Issues

### **Bug Reports**
Use the bug report template and include:
- Steps to reproduce
- Expected behavior
- Actual behavior  
- Browser and assistive technology info
- Screenshots or code samples

### **Accessibility Issues**
Accessibility bugs are treated as high priority. Please include:
- Assistive technology used
- WCAG guideline violated
- Specific user impact
- Suggested solution if known

## 💬 Getting Help

### **Questions and Support**
- **GitHub Discussions**: General questions and feature discussions
- **GitHub Issues**: Bug reports and specific problems
- **Email**: support@terminaldrift.digital for sensitive issues

### **Contributing Support**
New to accessibility or Rails development? We're here to help!
- Look for "good first issue" labels
- Ask questions in discussions
- Request mentorship in your PR

## 🏆 Recognition

Contributors are recognized in:
- README.md acknowledgments
- Release notes
- Annual contributor highlights
- Optional LinkedIn recommendations

## 📄 Code of Conduct

This project follows the [Contributor Covenant](https://www.contributor-covenant.org/) Code of Conduct. By participating, you're expected to uphold this code.

### **Our Standards**
- Use welcoming and inclusive language
- Respect different viewpoints and experiences  
- Accept constructive criticism gracefully
- Focus on what's best for the community
- Show empathy towards other community members

## 📞 Contact

- **Project Maintainer**: Jennifer Picado (support@terminaldrift.digital)
- **Accessibility Questions**: Use GitHub discussions
- **Security Issues**: Email support@terminaldrift.digital

---

**Thank you for helping make the web more accessible for everyone! 🌟**