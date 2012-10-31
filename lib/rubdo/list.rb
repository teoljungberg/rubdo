require 'time'
require 'yaml'
require 'fileutils'

module Rubdo
  class List
    attr_reader :items, :completed, :storage

    def self.read(file)
      return YAML.load_file(file) if File.exists? file
      []
    end

    def initialize(todos)
      @items = todos
      @storage = File.expand_path('~/.tasks/Todo.yml')
      FileUtils.mkdir_p File.dirname @storage
    end

    def add(description)
      @items << Item.new(description)
    end

    def write
      File.open(self.storage, 'w') { |todos| todos.write(@items.to_yaml) }
    end

    def done(id)
      @items.delete_at id
    end

    def to_a
      self.items
    end

    alias_method :<<, :add
  end
end
