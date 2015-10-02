require_relative 'item'

module Armor
  # Common state and behavior for all armor
  class Base < Item::Base
    attr_reader :armor_class

    def initialize(armor_class)
      @armor_class = armor_class
    end

    def pick_up(player)
      super(player)
      player.wear(self)
    end
  end

  # Boiled leather armor
  class Leather < Base
    def initialize
      super(2)
    end

    def name
      'leather armor'
    end
  end

  # Ring armor
  class Ring < Base
    def initialize
      super(4)
    end

    def name
      'ring armor'
    end
  end

  # Chain over gambeson armor
  class Chain < Base
    def initialize
      super(6)
    end

    def name
      'chain armor'
    end
  end

  # Plate armor
  class Plate < Base
    def initialize
      super(10)
    end

    def name
      'plate armor'
    end
  end
end
