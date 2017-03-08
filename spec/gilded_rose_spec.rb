require 'spec_helper'

describe GildedRose do
    let(:item_double){instance_double("Item", :name => 'Milk', :sell_in => 3, :quality => 4)}
    # let(:item_double){instance_double("Item", :name => 'Aged Brie', :sell_in => 2, :quality => 0)}
    # let(:item_double2){instance_double("Item", :name => 'Elixir of the Mongoose', :sell_in => 5, :quality => 7)}
    # let(:item_double3){instance_double("Item", :name => 'Sulfuras, Hand of Ragnaros', :sell_in => 0, :quality => 80)}
    let(:items_double){[item_double]}
    subject(:gilded_rose){described_class.new(items_double)}

    it 'initializes with an array of items' do
      expect{described_class.new(items_double)}.not_to raise_error
    end

    describe '#update_quality' do
      it 'lowers the quality at the end of each day' do
          allow(item_double).to receive(:sell_in=){"Received"}
          expect(item_double).to receive(:quality=).with(item_double.quality-1)
          gilded_rose.update_quality
      end

      it 'lowers the sell_in at the end of each day' do
        allow(item_double).to receive(:quality=){"Received"}
        expect(item_double).to receive(:sell_in=).with(item_double.sell_in-1)
        gilded_rose.update_quality
      end
    end
end
