# frozen_string_literal: true

require 'rspec'

RSpec.describe SprocketsTerserWithSourceMaps::Railtie do
  let(:app) { Rails.application }

  context 'Railtie applied' do
    it 'successfully generates the environment in app assets' do
      expect(app.assets).to be_a Sprockets::Environment
    end
  end

  context 'Compressor configured' do
    it 'returns the correct class for js_compressor' do
      expect(app.assets.js_compressor).to be SprocketsTerserWithSourceMaps::Compressor
    end
  end

  context 'Terser configuration defined' do
    it 'returns the passed configuration' do
      expect(app.config.assets.terser).to eq({ compress: { drop_console: true } })
    end
  end

  context 'Precompile assets with compile as true' do
    it 'generates assets with sources and maps' do
      app.load_tasks

      path = "#{app.assets_manifest.dir}/application-#{Rails.application.assets['application.js'].etag}.js"

      prefix = Rails.application.config.assets.prefix
      source_prefix = Rails.application.config.assets.uncompressed_prefix
      source_path = File.join(
        app.root,
        'public',
        prefix,
        source_prefix,
        'application-67edb0733821d001c895de576601b754165d9a2a350e6abd1e8c009d9ea24c1c.js'
      )

      map_prefix = Rails.application.config.assets.sourcemaps_prefix
      map_path = File.join(
        app.root,
        'public',
        prefix,
        map_prefix,
        'application-8e484580fdd7121444478bdee52a61a6e8d44684c6c7fe030bde5979a58a13c6.js.map'
      )

      Rake.application['assets:precompile'].execute

      expect(File.exist?(path)).to be
      expect(File.exist?(source_path)).to be
      expect(File.exist?(map_path)).to be
      expect(File.exist?("#{map_path}.gz")).to be
    end
  end
end
