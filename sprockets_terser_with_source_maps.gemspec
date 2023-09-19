# frozen_string_literal: true

require_relative 'lib/sprockets_terser_with_source_maps/version'

Gem::Specification.new do |spec|
  spec.name          = 'sprockets_terser_with_source_maps'
  spec.version       = SprocketsTerserWithSourceMaps::VERSION
  spec.authors       = ['Javier Menéndez Rizo']
  spec.email         = ['jmenendez087@gmail.com']

  spec.summary       = 'Write a short summary, because RubyGems requires one.'
  spec.description   = 'Write a longer description or delete this line.'
  spec.homepage      = 'https://github.com/javier-menendez/sprockets_terser_with_source_maps'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/javier-menendez/sprockets_terser_with_source_maps'
  spec.metadata['changelog_uri'] = 'https://github.com/javier-menendez/sprockets_terser_with_source_maps'

  spec.add_dependency 'sprockets-rails', '~> 3.0'
  spec.add_dependency 'terser', '~> 1.1.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
