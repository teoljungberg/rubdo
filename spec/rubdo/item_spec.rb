require 'rubdo/item'

describe Rubdo::Item do
  let(:item) { Rubdo::Item.new 'New todo item' }

  describe '#new' do
    it 'assigns a description to the item' do
      item.description.should eq 'New todo item'
    end
  end
end
