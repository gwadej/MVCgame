require 'rspec'

shared_examples 'an item' do |name|
  it '#name' do
    expect(subject).to respond_to(:name)
  end

  it 'has correct name' do
    expect(subject.name).to match(name)
  end

  it '#pick_up' do
    expect(subject).to respond_to(:pick_up).with(1).argument
  end

  it 'is an item on contact' do
    expect(subject.contact).to be :item
  end
end

class MockInventoryHolder
  attr_reader :inventory

  def initialize
    @inventory = []
  end

  def add_inventory(item)
    @inventory.push(item)
  end
end

shared_examples 'an inventory item' do
  let(:player) { MockInventoryHolder.new }

  it 'puts itself in the inventory' do
    subject.pick_up(player)
    expect(player.inventory).to include subject
  end
end


