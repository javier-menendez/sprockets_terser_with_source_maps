# frozen_string_literal: true

RSpec.describe SprocketsTerserWithSourceMaps::Compressor do

  it 'respond to call' do
    expect(subject.respond_to?(:call)).to be
  end
end
