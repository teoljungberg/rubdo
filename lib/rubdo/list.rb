require 'time'
require 'yaml'
require 'fileutils'

module Rubdo
  class List
    attr_reader :items, :completed, :storage

    def initialize
      @storage = File.expand_path('~/.tasks/Todo.yml')
      @items = []
      FileUtils.mkdir_p File.dirname @storage
      @items = read(@storage)
    end

    def add(description)
      @items << Item.new(description)
    end

    def write
      File.open(@storage, 'w') { |todos| todos.write(@items.to_yaml) }
    end

    def read(file)
      return YAML.load_file(file) if File.exists? file
      []
    end

    def done(id)
      @items.delete_at id
    end

    def to_s
      return @items
    end

    alias_method :<<, :add
  end
end
