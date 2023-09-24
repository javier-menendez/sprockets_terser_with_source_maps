# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in sprockets_terser_with_source_maps.gemspec
gemspec path: '..'

gem 'railties', '~> 4.2.0'
gem 'rake', '~> 12.0'
gem 'rspec', '~> 3.0'
gem 'rubocop', group: 'development', require: false
gem 'sprockets', '~> 3.0'
