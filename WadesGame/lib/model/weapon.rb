require_relative 'item'

module Weapon
  class Base < Item::Base
    attr_reader :min_damage, :max_damage
    def initialize(min, max)
      @min_damage = min
      @max_damage = max
    end

    def pick_up(player)
      super(player)
      player.wield(self)
    end

    def attack
      rand(min_damage..max_damage)
    end
  end

  class Dagger < Base
    def initialize
      super(1, 4)
    end

    def name
      'dagger'
    end
  end

  class Sword < Base
    def initialize
      super(2, 10)
    end
    def name
      'sword'
    end
  end

  class Axe < Base
    def initialize
      super(3, 16)
    end
    def name
      'axe'
    end
  end

  class Staff < Base
    def initialize
      super(1, 8)
    end
    def name
      'staff'
    end
  end
end
