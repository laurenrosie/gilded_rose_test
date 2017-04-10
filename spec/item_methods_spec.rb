require 'item'
require 'item_type_methods'
include ItemTypeMethods

describe 'item type methods' do
  describe '#is_regular?' do
    it 'correctly identifies regular' do
      item = Item.new('regular thing', 5, 10)
      expect(is_regular?(item)).to eq true
    end

    it 'correctly identifies a non regular item' do
      item = Item.new('non regular thing sulfuras', 5, 10)
      expect(is_regular?(item)).to eq false
    end

  end

  describe 'is_aged?' do
    it 'correctly identifies an aged item' do
      item = Item.new('aged something', 5, 10)
      expect(is_aged?(item)).to eq true
    end

    it 'correctly identifies a non aged item' do
      item = Item.new('non ag item', 5, 10)
      expect(is_aged?(item)).to eq false
    end

    it 'can cope with capitals' do
      item = Item.new('Aged something', 5, 10)
      expect(is_aged?(item)).to eq true
    end
  end

  describe 'is_passes?' do
    it 'correctly identifies passes' do
      item = Item.new('passes item', 5, 10)
      expect(is_passes?(item)).to eq true
    end

    it 'can cope with capitals' do
      item = Item.new('Passes item', 5, 10)
      expect(is_passes?(item)).to eq true
    end

    it 'correctly identities a non passes item' do
      item = Item.new('Something', 5, 10)
      expect(is_passes?(item)).to eq false
    end
  end
end
