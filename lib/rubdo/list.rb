require 'time'
require 'yaml'

module Rubdo
  class List
    def self.read(file = nil)
      @@todo_file = expand(ENV['TODO_FILE'] || file)
      File.exists?(@@todo_file) ? YAML.load_file(@@todo_file) : []
    end

    def initialize(todos)
      @items = todos
    end

    def add(description)
      @items << Item.new(description)
    end
    alias_method :<<, :add

    def done(id)
      @items.delete_at id
    end

    def edit(id)
      @items[id]
    end

    def write
      File.open(todo_file, 'w') { |todos| todos.write(@items.to_yaml) }
    end
    alias_method :save, :write

    def to_a
      @items
    end

    def todo_file
      @@todo_file
    end

    private

    def self.expand(file)
      File.expand_path file
    end
  end
end
