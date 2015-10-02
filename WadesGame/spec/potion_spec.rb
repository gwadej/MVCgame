require 'rspec'
require 'support/item_helpers'

require 'model/potion'

describe Potion::Water do
  let(:potion) { Potion::Water.new }

  it '#quaff' do
    expect(potion).to respond_to(:quaff)
  end

  subject { potion }
  it_behaves_like 'an item', 'potion of water'
  it_behaves_like 'an inventory item'
end

describe Potion::MinorHealing do
  let(:potion) { Potion::MinorHealing.new }

  it '#quaff' do
    expect(potion).to respond_to(:quaff)
  end

  subject { potion }
  it_behaves_like 'an item', 'potion of minor healing'
  it_behaves_like 'an inventory item'
end

describe Potion::MajorHealing do
  let(:potion) { Potion::MajorHealing.new }

  it '#quaff' do
    expect(potion).to respond_to(:quaff)
  end

  subject { potion }
  it_behaves_like 'an item', 'potion of major healing'
  it_behaves_like 'an inventory item'
end

describe Potion::Sleep do
  let(:potion) { Potion::Sleep.new }

  it '#quaff' do
    expect(potion).to respond_to(:quaff)
  end

  subject { potion }
  it_behaves_like 'an item', 'potion of sleep'
  it_behaves_like 'an inventory item'
end
