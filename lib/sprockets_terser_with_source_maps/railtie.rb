# frozen_string_literal: true

require 'action_controller/railtie'

module SprocketsTerserWithSourceMaps
  class Railtie < ::Rails::Railtie

    initializer 'sprockets-terser-with-source-maps.environment', group: :all do |app|
      config = app.config
      config.assets.sourcemaps_prefix ||= 'maps'
      config.assets.uncompressed_prefix ||= 'sources'
      config.assets.sourcemaps_url_root ||= false
    end
  end
end
