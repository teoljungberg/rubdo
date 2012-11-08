require 'rspec'
require 'rubdo'

describe Rubdo::Item do
  before do
    @item = Rubdo::Item.new('New todo item')
  end

  describe '#new' do
    it 'assigns a text value to rubdo' do
      @item.description.should eq('New todo item')
    end
  end
end

describe Rubdo::List do
  before do
    @list = Rubdo::List.new(Rubdo::List.read(File.join(File.dirname(__FILE__), 'test.yml')))
  end

  describe '#add' do
    it 'adds 3 todo items' do
      @list.add('Buy milk')
      @list.add('Buy beer')
      @list.add('But peanuts')
      @list.to_a.size.should eq(3)
    end
  end

  describe '#done' do
    before do
      @list = Rubdo::List.new(Rubdo::List.read(File.join(File.dirname(__FILE__), 'test.yml')))
    end

    it 'deletes a todo item' do
      @list.add('Watch TV')
      @list.add('Walk the dog')
      @list.done(0).description.should eq('Watch TV')
      @list.to_a.size.should eq(1)
    end
  end
end
