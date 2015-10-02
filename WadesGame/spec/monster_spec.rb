require 'rspec'
require 'model/monster'

shared_examples 'a monster' do
  it 'is created alive' do
    expect(subject.dead?).to be false
  end

  describe '#health and #dead?' do
    it 'damage is reduced by its armor' do
      subject.apply_damage(subject.health)
      expect(subject.health).to be subject.armor
      expect(subject.dead?).to be false
    end

    it 'will die if all health wiped' do
      subject.apply_damage(subject.health + subject.armor)
      expect(subject.health).to be 0
      expect(subject.dead?).to be true
    end
  end

  it 'is a monster on contact' do
    expect(subject.contact).to be :monster
  end

  it { expect(subject).to respond_to(:attack).with(1).argument }

  it 'base #hit_chance is reasonable' do
    expect(subject.hit_chance(0)).to be_between(0, 100).inclusive
  end

  it 'minimum #hit_chance is reasonable' do
    expect(subject.hit_chance(100)).to be_between(0, 50).inclusive
  end
end

describe Monster::Kobold do
  let(:monster) { Monster::Kobold.new }

  it 'has correct name' do
    expect(monster.name).to eq 'kobold'
  end

  it 'starts with full health' do
    expect(monster.health).to eq 10
  end

  subject { monster }
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

  subject { monster }
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

  subject { monster }
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

  subject { monster }
  it_behaves_like 'a monster'
end
