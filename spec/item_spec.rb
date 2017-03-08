require 'spec_helper'

describe Item do

  subject(:my_item){described_class.new('Milk', 5, 10)}
  it 'initializes with a name' do
    expect(my_item.name).to eq 'Milk'
  end

  it 'initializes with a sell_in' do
    expect(my_item.sell_in).to eq 5
  end

  it 'initializes with a quality' do
    expect(my_item.quality).to eq 10
  end

  describe '#to_s' do
    it 'converts the item to a string' do
      expect(my_item.to_s).to eq 'Milk, 5, 10'
    end
  end
end
