# frozen_string_literal: true

require_relative 'lib/sprockets_terser_with_source_maps/version'

Gem::Specification.new do |spec|
  spec.name          = 'sprockets_terser_with_source_maps'
  spec.version       = SprocketsTerserWithSourceMaps::VERSION
  spec.authors       = ['Javier Menéndez Rizo']
  spec.email         = ['jmenendez087@gmail.com']

  spec.summary       = 'Create javascript source maps for your Rails applications'
  spec.description   = 'Create source maps for your javascript assets along with their compression using terser.'
  spec.homepage      = 'https://github.com/javier-menendez/sprockets_terser_with_source_maps'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.2.0')

  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'changelog_uri' => 'https://github.com/javier-menendez/sprockets_terser_with_source_maps/blob/main/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/sprockets_terser_with_source_maps',
    'bug_tracker_uri' => 'https://github.com/javier-menendez/sprockets_terser_with_source_maps/issues',
    'rubygems_mfa_required' => 'true'
  }

  spec.add_dependency 'sprockets-rails', '~> 3.0'
  spec.add_dependency 'terser', '~> 1.1.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'railties', '>= 4.2'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir['README.md', 'lib/**/*.rb', 'LICENSE.txt', 'CHANGELOG.md']

  spec.require_paths = ['lib']
end
