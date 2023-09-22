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
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'source_code_uri' => 'https://github.com/javier-menendez/sprockets_terser_with_source_maps',
    'changelog_uri' => 'https://github.com/javier-menendez/sprockets_terser_with_source_maps',
    'rubygems_mfa_required' => 'true'
  }

  spec.add_dependency 'sprockets-rails', '~> 3.0'
  spec.add_dependency 'terser', '~> 1.1.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']
end
