require 'rspec'
require 'support/item_helpers'

require 'model/weapon'

class MockInventoryWielder
  attr_reader :inventory, :wielding

  def initialize
    @inventory = []
    @wielding = nil
  end

  def add_inventory(item)
    @inventory.push(item)
  end
  def wield(weapon)
    @wielding = weapon
  end
end

shared_examples 'a wieldable item' do
  let(:player) { MockInventoryWielder.new }

  it 'puts itself in the inventory' do
    subject.pick_up(player)
    expect(player.inventory).to include subject
  end

  it 'becomes wielded' do
    subject.pick_up(player)
    expect(player.wielding).to be subject
  end
end

describe Weapon::Dagger do
  let(:weapon) { Weapon::Dagger.new }

  it '#attack' do
    expect(weapon).to respond_to(:attack)
  end

  subject { weapon }
  it_behaves_like 'an item', 'dagger'
  it_behaves_like 'a wieldable item'
end

describe Weapon::Sword do
  let(:weapon) { Weapon::Sword.new }

  it '#attack' do
    expect(weapon).to respond_to(:attack)
  end

  subject { weapon }
  it_behaves_like 'an item', 'sword'
  it_behaves_like 'a wieldable item'
end

describe Weapon::Axe do
  let(:weapon) { Weapon::Axe.new }

  it '#attack' do
    expect(weapon).to respond_to(:attack)
  end

  subject { weapon }
  it_behaves_like 'an item', 'axe'
  it_behaves_like 'a wieldable item'
end

describe Weapon::Staff do
  let(:weapon) { Weapon::Staff.new }

  it '#attack' do
    expect(weapon).to respond_to(:attack)
  end

  subject { weapon }
  it_behaves_like 'an item', 'staff'
  it_behaves_like 'a wieldable item'
end
