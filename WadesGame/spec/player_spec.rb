require 'rspec'
require 'model/player'

shared_examples 'a combatant' do
  it 'is created alive' do
    expect(subject.dead?).to be false
  end

  describe '#health and #dead?' do
    #    Doesn't work with no toughness
#    it 'damage is reduced by its armor' do
#      subject.apply_damage(subject.health)
#      expect(subject.health).to be subject.toughness
#      expect(subject.dead?).to be false
#    end

    it 'will die if all health wiped' do
      subject.apply_damage(subject.health + subject.toughness)
      expect(subject.health).to be 0
      expect(subject.dead?).to be true
    end
  end

  it { expect(subject).to respond_to(:attack).with(1).argument }

  it 'base #hit_chance is reasonable' do
    expect(subject.hit_chance(0)).to be_between(0, 100).inclusive
  end

  it 'minimum #hit_chance is reasonable' do
    expect(subject.hit_chance(100)).to be_between(0, 50).inclusive
  end
end

describe Player do
  let(:player) { Player.new('cohen') }

  it 'has correct name' do
    expect(player.name).to eq 'cohen'
  end

  it 'starts with full health' do
    expect(player.health).to be 20
  end

  it { expect(subject).to respond_to(:add_inventory).with(1).argument }
  it { expect(subject).to respond_to(:add_gold).with(1).argument }
  it { expect(subject).to respond_to(:wield).with(1).argument }
  it { expect(subject).to respond_to(:wear).with(1).argument }

  subject { player }
  it_behaves_like 'a combatant'
end
