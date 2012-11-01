module Rubdo
  class Item
    attr_reader :description

    def initialize(description)
      @description = description
    end

    def to_s
      self.description
    end
  end
end
