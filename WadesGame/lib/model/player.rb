# Describe the player
class Player
  attr_reader :name, :inventory, :gold, :weapon, :armor,
    :health, :toughness
  # TODO: probably should not just return the inventory collection

  def initialize(name)
    @name = name
    @health = 20
    @inventory = []
    @gold = 0
    @weapon = nil
    @toughness = 0
  end

  def dead?
    health <= 0
  end

  def add_inventory(item)
    @inventory.push(item)
  end

  def add_gold(value)
    @gold += value if value > 0
  end

  def wield(weapon)
    @weapon = weapon
  end

  def wear(armor)
    @armor = armor
    @toughness = armor.armor_class
  end

  def attack(penalty)
    return nil unless attack_hits?(penalty)
    generate_damage
  end

  def apply_damage(damage)
    damage -= toughness
    @health -= damage if damage > 0
  end

  def attack_hits?(penalty)
    chance = hit_chance(penalty)
    chance != 0 ? rand(0..100) < chance : false
  end

  def hit_chance(penalty)
    chance = 25 - penalty
    chance < 10 ? 10 : chance
  end

  def generate_damage
    if weapon.nil?
      rand(0..2)
    else
      weapon.attack
    end
  end
end
