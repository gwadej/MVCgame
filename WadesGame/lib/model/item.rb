module Item
  class Base
    def contact
      :item
    end

    def pick_up(player)
      player.add_inventory(self)
    end
  end

  class Gold < Base
    attr_reader :value
    def initialize
      @value = rand(5..30)
    end

    # If the player picks up the item, gold is added and nothing to put in
    # inventory
    def pick_up(player)
      player.add_gold(value)
    end

    def name
      'gold'
    end
  end

  class Diamond < Base
    def pick_up(player)
      puts "Congratulations, #{player.name}! You win."
      exit
    end

    def name
      'Diamond'
    end
  end
end
