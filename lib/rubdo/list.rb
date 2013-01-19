require 'time'
require 'yaml'

module Rubdo
  class List

    attr_reader :items, :todo_file

    def self.read(file = nil)
      todo_file = File.expand_path(file)
      items = File.exists?(todo_file) ? YAML.load_file(todo_file) : []
      { items: items, todo_file: todo_file }
    end

    def initialize(options)
      @items = options.fetch(:items) { [] }
      @todo_file = options.fetch(:todo_file) { File.expand_path("~/.tasks/Todo.yml") }
    end

    def add(description)
      items << Item.new(description)
    end
    alias_method :<<, :add

    def done(id)
      items.delete_at id
    end

    def edit(id)
      items[id]
    end

    def write
      File.open(todo_file, 'w') { |f| f.write(items.to_yaml) }
    end
    alias_method :save, :write

    def to_a
      items
    end
  end
end
