# Accessibility Rails Components

Rails ViewComponent library implementing WCAG 2.1 AA accessible UI patterns with repeatable setup, test, and documentation workflows.

**Live demo:** [accessibility-rails-components.onrender.com](https://accessibility-rails-components.onrender.com)  
**Tech spec:** [docs/TECH_SPEC.md](docs/TECH_SPEC.md)

## Problem
Teams frequently need reusable UI building blocks that remain accessible, testable, and maintainable across product releases.

## Solution
This repository demonstrates a Rails component library approach where accessibility requirements are treated as a core engineering constraint rather than a post-release fix.

## Architecture
- `app/components/` for reusable UI component definitions.
- `app/` and `config/` for Rails application integration and configuration.
- `docs/` for usage and implementation guidance.
- `Gemfile` and project scripts for dependency and runtime management.

## Tech Stack
- Ruby on Rails
- ViewComponent-style component architecture
- Stimulus/Tailwind-oriented frontend patterns
- Ruby test tooling and accessibility-oriented validation

## Quick Start
```bash
bundle install
rails db:setup
rails server
```

## Testing
- `bundle install && bundle exec ruby -c app/components/accessible_button_component.rb`
- Component syntax and dependency checks run in `.github/workflows/ci.yml`
- Accessibility checks documented in `docs/`

## ANZSCO 261312 Competency Evidence
- **Software design and development**: modular component architecture for scalable UI systems.
- **Implementation quality**: accessibility-aware engineering embedded in component development.
- **Maintenance readiness**: clear documentation and repeatable setup/testing workflow.

## Commit Convention
Use Conventional Commits for presentation clarity:
- `feat(scope): add new user-facing capability`
- `fix(scope): resolve functional defect`
- `test(scope): add or improve automated tests`
- `docs(readme): improve project documentation`

## Evidence Map
- `app/components/`
- `app/`
- `config/`
- `docs/TECH_SPEC.md`
- `docs/adr/`
- `Gemfile`

---

**Maintained by:** [Dark Heart Labs](https://darkheartlabs.technology)  
**Author:** Jennifer ([@jv-darkheartlabs](https://github.com/jv-darkheartlabs))  
**Site:** https://darkheartlabs.technology
