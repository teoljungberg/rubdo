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
  describe '#add' do
    before do
      @list = Rubdo::List.new(Rubdo::List.read(File.join(File.dirname(__FILE__), 'test.yml')))
      @list.add('Buy milk')
      @list.add('Buy beer')
      @list.add('But peanuts')
    end

    it 'checks if the all added items are there' do
      @list.to_a.size.should equal 3
    end

    it 'deletes a todo item' do
      @list.done(0).description.should eq('Buy milk')
      @list.to_a.size.should equal 2
    end
  end
end
