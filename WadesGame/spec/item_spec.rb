require 'rspec'
require 'support/item_helpers'

require 'model/item'

describe Item::Gold do
  let(:item) { Item::Gold.new }

  subject { item }
  it_behaves_like 'an item', 'gold'
end

describe Item::Diamond do
  let(:item) { Item::Diamond.new }

  subject { item }
  it_behaves_like 'an item', 'Diamond'
end
