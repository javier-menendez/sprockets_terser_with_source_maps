# frozen_string_literal: true

require 'open3'

RSpec.describe SprocketsTerserWithSourceMaps::Autoload do
  describe 'deferred loading of Terser' do
    it 'does not require terser when Rails initializes' do
      script = <<~RUBY
        require 'bundler/setup'
        require 'sprockets/railtie'
        require 'sprockets_terser_with_source_maps'

        ENV['RAILS_ENV'] = 'test'
        require 'rails_app/config/environment'

        if defined?(::Terser)
          abort 'FAIL: Terser was eagerly loaded during Rails initialization'
        end

        # Trigger the autoload by referencing the constant
        klass = SprocketsTerserWithSourceMaps::Autoload::Terser

        unless defined?(::Terser)
          abort 'FAIL: Terser was not loaded after referencing Autoload::Terser'
        end

        unless klass == ::Terser
          abort 'FAIL: Autoload::Terser does not match ::Terser'
        end

        puts 'OK'
      RUBY

      gemfile = ENV['BUNDLE_GEMFILE'] || File.expand_path('../../Gemfile', __dir__)
      env = { 'BUNDLE_GEMFILE' => gemfile }

      stdout, stderr, status = Bundler.with_unbundled_env do
        Open3.capture3(env, RbConfig.ruby, '-I', File.expand_path('..', __dir__), '-I', __dir__, '-e', script)
      end

      expect(status).to be_success, "Subprocess failed:\n#{stderr}"
      expect(stdout.strip).to eq('OK')
    end
  end

  it 'aliases Autoload::Terser to ::Terser' do
    expect(SprocketsTerserWithSourceMaps::Autoload::Terser).to eq(Terser)
  end
end
