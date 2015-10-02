require 'rspec'
require 'support/item_helpers'

require 'model/Armor'

class MockInventoryWearer
  attr_reader :inventory, :wearing

  def initialize
    @inventory = []
    @wearing = nil
  end

  def add_inventory(item)
    @inventory.push(item)
  end
  def wear(armor)
    @wearing = armor
  end
end

shared_examples 'a wearable item' do
  let(:player) { MockInventoryWearer.new }

  it 'puts itself in the inventory' do
    subject.pick_up(player)
    expect(player.inventory.last).to be subject
  end

  it 'is worn' do
    subject.pick_up(player)
    expect(player.wearing).to be subject
  end
end

describe Armor::Leather do
  let(:armor) { Armor::Leather.new }

  subject { armor }
  it_behaves_like 'an item', 'leather armor'
  it_behaves_like 'a wearable item'
end

describe Armor::Ring do
  let(:armor) { Armor::Ring.new }

  subject { armor }
  it_behaves_like 'an item', 'ring armor'
  it_behaves_like 'a wearable item'
end

describe Armor::Chain do
  let(:armor) { Armor::Chain.new }

  subject { armor }
  it_behaves_like 'an item', 'chain armor'
  it_behaves_like 'a wearable item'
end

describe Armor::Plate do
  let(:armor) { Armor::Plate.new }

  subject { armor }
  it_behaves_like 'an item', 'plate armor'
  it_behaves_like 'a wearable item'
end
