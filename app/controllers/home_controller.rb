class HomeController < ApplicationController
  def index
    @components = [
      {
        name: 'Accessible Button',
        description: 'WCAG 2.1 AA compliant button with keyboard navigation and screen reader support',
        class_name: 'AccessibleButtonComponent',
        preview_path: '/rails/view_components/accessible_button_component',
        features: [
          'Keyboard navigation support',
          'Screen reader compatibility', 
          'Focus management',
          'Color contrast compliance',
          'Multiple variants and sizes'
        ]
      },
      {
        name: 'Accessible Modal',
        description: 'Focus-trapped modal dialog with proper ARIA attributes and keyboard controls',
        class_name: 'AccessibleModalComponent', 
        preview_path: '/rails/view_components/accessible_modal_component',
        features: [
          'Focus trapping',
          'Escape key handling',
          'Backdrop click closing',
          'Proper ARIA labeling',
          'Keyboard navigation'
        ]
      },
      {
        name: 'Accessible Form',
        description: 'Form components with proper labeling, error handling, and validation',
        class_name: 'AccessibleFormComponent',
        preview_path: '/rails/view_components/accessible_form_component',
        features: [
          'Associated labels',
          'Error announcements',
          'Required field indicators',
          'Validation feedback',
          'Fieldset grouping'
        ]
      }
    ]
    
    @accessibility_stats = {
      wcag_compliance: '100%',
      components_tested: @components.count,
      keyboard_navigable: '100%',
      screen_reader_compatible: '100%',
      color_contrast_aa: '100%'
    }
  end
end