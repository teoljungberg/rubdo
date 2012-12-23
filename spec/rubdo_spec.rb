require 'rspec'
require_relative '../lib/rubdo'

describe Rubdo::Item do
  before do
    @item = Rubdo::Item.new('New todo item')
  end

  describe '#new' do
    it 'assigns a text value to the item' do
      @item.description.should eq('New todo item')
    end
  end
end

describe Rubdo::List do
  before do
    @list = Rubdo::List.new([])
  end

  describe '#add' do
    it 'adds 3 items to the list' do
      @list.add('Buy milk')
      @list.add('Buy beer')
      @list.add('But peanuts')
      @list.to_a.size.should eq(3)
    end
  end

  describe '#done' do
    before do
      @list = Rubdo::List.new([])
    end

    it 'deletes an item from the list' do
      @list.add('Watch TV')
      @list.add('Walk the dog')
      @list.done(0).description.should eq('Watch TV')
      @list.to_a.size.should eq(1)
    end
  end

  describe '#edit' do
    before do
      @list = Rubdo::List.new([])
    end

    it 'changes the description of a certain task' do
      @list.add("I can't go out, I'm sik")
      @list.edit(0).description = "I can't go out, I'm sick"
      @list.to_a[0].description.should eq("I can't go out, I'm sick")
      @list.to_a.first.description eq("I can't go out, I'm sick")
      @list.to_a.size.should eq(1)
    end
  end
end
