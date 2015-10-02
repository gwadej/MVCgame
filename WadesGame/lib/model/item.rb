module Item
  # Interface for all items
  class Base
    def contact
      :item
    end

    def pick_up(player)
      player.add_inventory(self)
    end
  end

  # Gold the player can add to their wallet
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

  # The goal item, a brilliant diamond
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
