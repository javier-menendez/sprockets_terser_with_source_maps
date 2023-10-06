# frozen_string_literal: true

module RailsApp
  class Application < Rails::Application
    config.root = File.expand_path('..', __dir__)

    config.assets.version = '1.0'
    config.assets.compile = true

    config.assets.js_compressor = :terser_with_source_maps
    config.assets.terser = { compress: { drop_console: true } }

    config.eager_load = false
  end
end

# Cache disabled
Rails.application.config.assets.configure do |env|
  env.cache = ActiveSupport::Cache.lookup_store(:null_store)
end
