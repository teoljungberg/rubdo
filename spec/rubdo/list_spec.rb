require 'rubdo/list'
require 'rubdo/item'

describe Rubdo::List do
  let(:list) { Rubdo::List.new items: [], todo_file: '/tmp/todo.yml' }

  describe '#new' do
    let(:empty_list) { Rubdo::List.new({})}

    context 'with parameters' do
      it 'sets `items` and `todo_file`' do
        list.items.should eq []
        list.todo_file.should eq '/tmp/todo.yml'
      end
    end

    context 'without parameters' do
      it 'fallback for `items` and `todo_file`' do
        empty_list.items.should eq []
        empty_list.todo_file.should eq File.expand_path('~/.tasks/Todo.yml')
      end
    end
  end

  describe '#add' do
    it 'adds 3 items to the list' do
      list.add 'Buy milk'
      list.add 'Buy beer'
      list.add 'But peanuts'

      list.to_a.size.should eq 3
    end
  end

  describe '#done' do
    it 'deletes an item from the list' do
      list.add 'Watch TV'
      list.add 'Walk the dog'
      list.to_a.size.should eq 2
      list.done 0

      list.to_a.size.should eq 1
    end
  end

  describe '#edit' do
    it 'changes the description of a certain task' do
      list.add "I can't go out, I'm sik"
      list.edit(0).description = "I can't go out, I'm sick"

      list.to_a[0].description.should eq "I can't go out, I'm sick"
      list.to_a.size.should eq 1
    end
  end
end
