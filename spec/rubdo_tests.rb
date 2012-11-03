require 'minitest/autorun'
require 'rubdo'

describe Rubdo::Item do
  before do
    @item = Rubdo::Item.new('New todo item')
  end

  it 'assigns a text value to rubdo' do
    @item.description.must_equal 'New todo item'
  end
end

describe Rubdo::List do
  before do
    @list = Rubdo::List.new(Rubdo::List.read(File.join(File.dirname(__FILE__), 'test.yml')))
    @list.add('Buy milk')
    @list.add('Buy beer')
    @list.add('But peanuts')
  end

  it 'checks if the all added items are there' do
    @list.to_a.size.must_equal 3
  end

  it 'deletes a todo item' do
    @list.done(0).description.must_equal 'Buy milk'
    @list.to_a.size.must_equal 2
  end
end
