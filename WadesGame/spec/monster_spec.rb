require 'rspec'
require 'model/monster'

shared_examples 'a monster' do
  let(:monster) { described_class.new }

  it 'is created alive' do
    expect(monster.dead?).to be false
  end

  describe '#health and #dead?' do
    it 'damage is reduced by its armor' do
      monster.apply_damage(monster.health)
      expect(monster.health).to be monster.armor
      expect(monster.dead?).to be false
    end

    it 'will die if all health wiped' do
      monster.apply_damage(monster.health + monster.armor)
      expect(monster.health).to be 0
      expect(monster.dead?).to be true
    end
  end

  it 'is a monster on contact' do
    expect(monster.contact).to be :monster
  end

  it { expect(monster).to respond_to(:attack).with(1).argument }
end

describe Monster::Kobold do
  let(:monster) { Monster::Kobold.new }

  it 'has correct name' do
    expect(monster.name).to eq 'kobold'
  end

  it 'starts with full health' do
    expect(monster.health).to eq 10
  end

  it_behaves_like 'a monster'
end

describe Monster::Goblin do
  let(:monster) { Monster::Goblin.new }

  it 'has correct name' do
    expect(monster.name).to eq 'goblin'
  end

  it 'starts with full health' do
    expect(monster.health).to eq 15
  end

  it_behaves_like 'a monster'
end

describe Monster::Orc do
  let(:monster) { Monster::Orc.new }

  it 'has correct name' do
    expect(monster.name).to eq 'orc'
  end

  it 'starts with full health' do
    expect(monster.health).to eq 25
  end

  it_behaves_like 'a monster'
end

describe Monster::Troll do
  let(:monster) { Monster::Troll.new }

  it 'has correct name' do
    expect(monster.name).to eq 'troll'
  end

  it 'starts with full health' do
    expect(monster.health).to eq 35
  end

  it_behaves_like 'a monster'
end
