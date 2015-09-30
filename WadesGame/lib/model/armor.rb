require_relative 'item'

module Armor
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

  class Leather < Base
    def initialize
      super(2)
    end
    def name
      'leather'
    end
  end

  class Ring < Base
    def initialize
      super(4)
    end
    def name
      'ring'
    end
  end

  class Chain < Base
    def initialize
      super(6)
    end
    def name
      'chain'
    end
  end

  class Plate < Base
    def initialize
      super(10)
    end
    def name
      'plate'
    end
  end
end
