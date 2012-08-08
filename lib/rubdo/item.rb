require 'time'

module Rubdo
  class Item
    attr_accessor :description, :done, :completed_at
    attr_reader :id, :created_at

    def initialize(description)
      @done = false
      @description = description
      @created_at = Time.now
    end

    def to_s
      "#{description}: created at #{created_at.strftime('%m.%d.%y - %H:%M') }"
    end
  end
end
