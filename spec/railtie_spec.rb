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
end
