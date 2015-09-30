require 'item'

module Potion
  class Water < Item::Base
    def quaff(_player)
      puts 'That was refreshing'
    end
  end

  class MinorHealing < Item::Base
    def quaff(player)
      damage = player.damage / 2
      if damage < 5
        damage = 5
      elsif damage > 20
        damage = 20
      end
      player.heal(damage)
    end
  end

  class MajorHealing < Item::Base
    def quaff(player)
      player.heal(40)
    end
  end

  class Sleep < Item::Base
    def quaff(_player)
      puts 'Player falls asleep'
    end
  end
end
