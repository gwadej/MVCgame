require 'rspec'
require 'monster'

describe 'Kobold' do
  let(:monster) { Monster::Kobold.new }

  it 'name is correct' do
    expect(monster.name).to eq 'kobold'
  end

  it 'starts full health' do
    expect(monster.health).to eq 10
    expect(monster.dead?).to be false
  end

  it 'saves health by armor' do
    monster.apply_damage(monster.health)
    expect(monster.health).to be monster.armor
  end

  it 'will die if all health wiped' do
    monster.apply_damage(monster.health + monster.armor)
    expect(monster.dead?).to be true
  end
end

describe 'Goblin' do
  let(:monster) { Monster::Goblin.new }

  it 'name is correct' do
    expect(monster.name).to eq 'goblin'
  end

  it 'starts full health' do
    expect(monster.health).to eq 15
  end
end

describe 'Orc' do
  let(:monster) { Monster::Orc.new }

  it 'name is correct' do
    expect(monster.name).to eq 'orc'
  end

  it 'starts full health' do
    expect(monster.health).to eq 25
  end
end

describe 'Troll' do
  let(:monster) { Monster::Troll.new }

  it 'name is correct' do
    expect(monster.name).to eq 'troll'
  end

  it 'starts full health' do
    expect(monster.health).to eq 35
  end
end
