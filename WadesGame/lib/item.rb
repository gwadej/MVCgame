module Item
  class Gold
    attr_reader :value
    def initialize
      @value = rand(5..30)
    end

    # If the player picks up the item, gold is added and nothing to put in
    # inventory
    def pick_up(player)
      player.add_gold(value)
    end
  end

  class Diamond
    def pick_up(_player)
      puts 'Congratulations!'
      exit
    end
  end

  class Weapon
    attr_reader :name, :min_damage, :max_damage
    def initialize(name, min, max)
      @name = name
      @min_damage = min
      @max_damage = max
    end

    def pick_up(player)
      player.add_inventory(self)
      player.wield(self)
    end

    def attack
      rand(min_damage..max_damage)
    end
  end

  class Armor
    attr_reader :name, :armor_class
    def initialize(name, armor_class)
      @name = name
      @armor_class = armor_class
    end

    def pick_up(player)
      player.add_inventory(self)
      player.wear(self)
    end
  end

  module Potion
    class Water
      def quaff(_player)
        puts 'That was refreshing'
      end

      def pick_up(player)
        player.add_inventory(self)
      end
    end

    class MinorHealing
      def quaff(player)
        damage = player.damage / 2
        if damage < 5
          damage = 5
        elsif damage > 20
          damage = 20
        end
        player.heal(damage)
      end

      def pick_up(player)
        player.add_inventory(self)
      end
    end

    class MajorHealing
      def quaff(player)
        player.heal(40)
      end

      def pick_up(player)
        player.add_inventory(self)
      end
    end

    class Sleep
      def quaff(_player)
        puts 'Player falls asleep'
      end

      def pick_up(player)
        player.add_inventory(self)
      end
    end
  end

  def make_item(char)
    case char
    when '$'
      Gold.new
    when '*'
      Diamond.new
    else
      item = make_weapon(char)
      item = make_armor(char) if item.nil?
      item = make_potion(char) if item.nil?
      item
    end
  end

  def make_weapon(char)
    case char
    when '!'
      Weapon.new('dagger', 1, 4)
    when ')'
      Weapon.new('sword', 2, 10)
    when '+'
      Weapon.new('axe', 3, 16)
    when '/'
      Weapon.new('staff', 1, 8)
    end
  end

  def make_armor(char)
    case char
    when ']'
      Weapon.new('leather', 2)
    when '['
      Weapon.new('ring', 4)
    when '%'
      Weapon.new('chain', 6)
    when '#'
      Weapon.new('plate', 10)
    end
  end

  def make_potion(char)
    case char
    when '.'
      Potion::Water.new
    when ','
      Potion::MinorHealing.new
    when ';'
      Potion::MajorHealing.new
    when '?'
      Potion::Sleep.new
    end
  end

end
