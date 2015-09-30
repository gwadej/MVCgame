module Monster
  class Base
    attr_reader :health, :armor
    def initialize(health, armor)
      @health = health
      @armor = armor
    end

    def attack
      return nil unless self.attack_hits?
      generate_damage
    end

    def apply_damage(damage)
      damage -= armor
      @health -= damage if damage > 0
    end

    def contact
      :monster
    end

    def dead?
      @health <= 0
    end

    protected

    def does_attack_hit?(chance)
      rand(0..100) < chance
    end

    def calc_damage(min, max)
      rand(min..max)
    end
  end

  class Kobold < Base
    def initialize
      super(10, 2)
    end

    def name
      'kobold'
    end

    def attack_hits?
      does_attack_hit?(25)
    end

    def generate_damage
      calc_damage(0, 5)
    end
  end

  class Goblin < Base
    def initialize
      super(15, 3)
    end

    def name
      'goblin'
    end

    def attack_hits?
      does_attack_hit?(30)
    end

    def generate_damage
      calc_damage(0, 7)
    end
  end

  class Orc < Base
    def initialize
      super(25, 5)
    end

    def name
      'orc'
    end

    def attack_hits?
      does_attack_hit?(50)
    end

    def generate_damage
      calc_damage(2, 15)
    end
  end

  class Troll < Base
    def initialize
      super(35, 7)
    end

    def name
      'troll'
    end

    def attack_hits?
      does_attack_hit?(80)
    end

    def generate_damage
      calc_damage(5, 20)
    end
  end
end
