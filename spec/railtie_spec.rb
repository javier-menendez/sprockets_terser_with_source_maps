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

      path = "#{app.assets_manifest.dir}/app-#{Rails.application.assets['app.js'].etag}.js"

      prefix = Rails.application.config.assets.prefix
      source_prefix = Rails.application.config.assets.uncompressed_prefix
      source_path = File.join(
        app.root,
        'public',
        prefix,
        source_prefix,
        'app-74b9b016d5c27e498f5a48fcdb2c0c4a4dcc2f366887ba2aa88c6add45f0054e.js'
      )

      map_prefix = Rails.application.config.assets.sourcemaps_prefix
      map_path = File.join(
        app.root,
        'public',
        prefix,
        map_prefix,
        'app-5183f15a684c3bdf30d628e250990a01941efe5dc45abbe356c3b8893cd6f264.js.map'
      )

      Rake.application['assets:clobber'].execute
      Rake.application['assets:precompile'].execute

      expect(File.exist?(path)).to be
      expect(File.exist?(source_path)).to be
      expect(File.exist?(map_path)).to be
    end
  end
end
