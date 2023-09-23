# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in sprockets_terser_with_source_maps.gemspec
gemspec

gem 'railties', '~> 5.2.0'
gem 'rake', '~> 12.0'
gem 'rspec', '~> 3.0'
gem 'rubocop', group: 'development', require: false
gem 'sprockets', github: 'rails/sprockets', branch: '3.x'
