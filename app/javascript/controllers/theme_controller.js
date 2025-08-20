import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    this.applyTheme()
  }

  toggle(event) {
    const theme = event.target.checked ? 'dark' : 'light'
    this.updateTheme(theme)
  }

  updateTheme(theme) {
    // Update the data attribute on the document element
    document.documentElement.setAttribute('data-theme', theme)
    
    // Store theme preference in localStorage for immediate response
    localStorage.setItem('theme', theme)
    
    // Send AJAX request to update user preference
    fetch('/settings/theme', {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ dark_mode: theme })
    })
    .then(response => response.json())
    .then(data => {
      if (data.status === 'error') {
        console.error('Failed to update theme:', data.message)
        // Revert the UI if server update failed
        this.revertTheme()
      }
    })
    .catch(error => {
      console.error('Error updating theme:', error)
      this.revertTheme()
    })
  }

  applyTheme() {
    // Get theme from user's saved preference or default to light
    const savedTheme = localStorage.getItem('theme') || 'light'
    document.documentElement.setAttribute('data-theme', savedTheme)
    
    // Update toggle state to match the theme
    const toggle = this.toggleTarget
    if (toggle) {
      toggle.checked = (savedTheme === 'dark')
    }
  }

  revertTheme() {
    // Revert to the previous theme state
    const currentTheme = document.documentElement.getAttribute('data-theme')
    const revertedTheme = currentTheme === 'dark' ? 'light' : 'dark'
    
    document.documentElement.setAttribute('data-theme', revertedTheme)
    localStorage.setItem('theme', revertedTheme)
    
    const toggle = this.toggleTarget
    if (toggle) {
      toggle.checked = (revertedTheme === 'dark')
    }
  }
}