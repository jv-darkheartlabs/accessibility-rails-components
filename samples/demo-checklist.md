# Demo checklist

## Fastest demo (Codespaces)
1. Open a Codespace from the repo.
2. Run: `bundle exec rails server -b 0.0.0.0 -p 3000`
3. Open `/rails/view_components`
4. Keyboard-only walkthrough (Tab / Shift+Tab / Enter / Escape where applicable).

## Accessibility audit
- Run: `axe http://localhost:3000/rails/view_components`

## What to point out
- Semantic markup patterns
- Focus management
- Contrast / reduced motion
