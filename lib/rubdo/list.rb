require 'time'
require 'yaml'
require 'fileutils'

module Rubdo
  class List
    attr_accessor :items, :storage

    def self.read(file)
      todos = YAML.load_file(file) if File.exists? file
      todos ||=[]

      todos
    end

    def initialize(todos)
      @items = todos
      @storage = File.expand_path('~/.tasks/Todo.yml')
      FileUtils.mkdir_p File.dirname @storage
    end

    def add(description)
      @items << Item.new(description)
    end

    def done(id)
      @items.delete_at id
    end

    def edit(id)
      @items[id]
    end

    def write
      File.open(self.storage, 'w') { |todos| todos.write(@items.to_yaml) }
    end

    def to_a
      self.items
    end

    alias_method :<<, :add
    alias_method :save, :write
  end
end
