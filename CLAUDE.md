# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GARDEN_MAX is a Ruby on Rails 7.1.5 application for garden management, built using Le Wagon's Rails template. Users can create gardens, manage plant collections, and track plantations with dates.

## Core Architecture

### Models & Relationships
- **User** (Devise authentication): has many gardens
- **Garden**: belongs to user, has many plantations/plants (through plantations), includes photo attachment
- **Plant**: has many gardens (through plantations), includes photo attachment  
- **Plantation**: join table connecting gardens and plants with plantation date

### Key Features
- User authentication via Devise
- Image uploads via Active Storage + Cloudinary
- Bootstrap 5 styling with Sass
- Stimulus controllers for JavaScript interactivity
- Modal-based plantation creation in garden show view

## Development Commands

### Setup & Dependencies
```bash
# Install dependencies
bundle install

# Database setup
bin/rails db:create db:migrate db:seed

# Start development server
bin/rails server
```

### Testing
```bash
# Run all tests
bin/rails test

# Run specific test files
bin/rails test test/models/garden_test.rb
bin/rails test test/controllers/gardens_controller_test.rb
```

### Database Operations
```bash
# Create and run migrations
bin/rails generate migration MigrationName
bin/rails db:migrate

# Seed database with plants
bin/rails db:seed

# Reset database
bin/rails db:drop db:create db:migrate db:seed
```

### Asset Pipeline
```bash
# Precompile assets for production
bin/rails assets:precompile

# Clean assets
bin/rails assets:clean
```

## File Structure Notes

- **Stylesheets**: Organized in `app/assets/stylesheets/` with page-specific files in `pages/` subdirectory
- **Plant Images**: Located in `app/assets/images/` with naming pattern "Plant Name - Variety.png"
- **Views**: ERB templates with Bootstrap styling, modal integration for plantation forms
- **Controllers**: Standard Rails CRUD patterns with nested plantation routes under gardens

## Key Configuration

- **Database**: PostgreSQL (development, test, production)
- **Image Storage**: Cloudinary for production file uploads
- **Authentication**: Devise with standard user model
- **CSS Framework**: Bootstrap 5 with custom Sass variables
- **JavaScript**: Stimulus + Importmap (no Webpack/Node.js)

## Current Git Branch Strategy
- Main branch: `master`
- Current feature branch: `design1` (working on UI improvements)