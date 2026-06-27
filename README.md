# Accessibility Rails Components
Portfolio repository aligned to ANZSCO 261312 (Developer Programmer), focused on reusable Rails UI components with accessibility-first implementation standards.

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
- `rails test`
- Run accessibility checks documented in `docs/`.

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
- `docs/`
- `Gemfile`
