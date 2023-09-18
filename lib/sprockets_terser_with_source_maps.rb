# frozen_string_literal: true

require 'sprockets'
require 'sprockets_terser_with_source_maps/version'
require 'sprockets_terser_with_source_maps/compressor'
require 'sprockets_terser_with_source_maps/railtie' if defined? Rails::Railtie
require 'terser'

Sprockets.register_compressor 'application/javascript',
                              :terser_with_source_maps,
                              SprocketsTerserWithSourceMaps::Compressor

