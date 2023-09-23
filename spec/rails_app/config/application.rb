# frozen_string_literal: true

module RailsApp
  class Application < Rails::Application
    config.root = File.expand_path('..', __dir__)

    config.assets.compile = true

    config.assets.js_compressor = :terser_with_source_maps
    config.assets.terser = { compress: { drop_console: true } }

    config.eager_load = false
  end
end
