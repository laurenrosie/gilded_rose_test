require 'spec_helper'

describe GildedRose do
    let(:item_double){instance_double("Item", :name => 'Milk', :sell_in => 3, :quality => 4)}
    let(:item_double2){instance_double("Item", :name => 'Aged Brie', :sell_in => 2, :quality => 0)}
    let(:item_double3){instance_double("Item", :name => 'Backstage passes to a TAFKAL80ETC concert', :sell_in => 15, :quality => 40)}
    let(:item_double4){instance_double("Item", :name => 'Backstage passes to a TAFKAL80ETC concert', :sell_in => 10, :quality => 40)}
    let(:item_double5){instance_double("Item", :name => 'Backstage passes to a TAFKAL80ETC concert', :sell_in => 5, :quality => 40)}
    let(:conjured_double){instance_double("Item", :name => 'Conjured genie', :sell_in => 15, :quality => 40)}
    let(:conjured_double2){instance_double("Item", :name => 'Conjured genie', :sell_in => -1, :quality => 40)}

    subject(:gilded_rose){described_class.new([item_double])}
    subject(:gilded_rose2){described_class.new([item_double2])}
    subject(:gilded_rose3){described_class.new([item_double3])}
    subject(:gilded_rose4){described_class.new([item_double4])}
    subject(:gilded_rose5){described_class.new([item_double5])}
    subject(:conjured_gilded_rose){described_class.new([conjured_double])}
    subject(:conjured_gilded_rose2){described_class.new([conjured_double2])}

    it 'initializes with an array of items' do
      expect{described_class.new([item_double])}.not_to raise_error
    end

    describe '#update_quality' do
  
      it 'does nothing to a legendary item' do
        legendary_item_double = instance_double("Item", :name => 'Sulfuras, Hand of Ragnaros', :sell_in => 0, :quality => 80)
        legendary_gilded_rose = described_class.new([legendary_item_double])
        expect(legendary_gilded_rose).to receive(:update_legendary).with(legendary_item_double)
        legendary_gilded_rose.update_quality
      end

      context 'sellin > 0' do
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

        it 'lowers the item quality at the end of each day for brie with quality<50' do
          allow(item_double2).to receive(:sell_in=){"Received"}
          expect(item_double2).to receive(:quality=).with(item_double2.quality+1)
          gilded_rose2.update_quality
        end

        it 'lowers the item quality at the end of each day for Backstage passes sell in above 11' do
          allow(item_double3).to receive(:sell_in=){"Received"}
          expect(item_double3).to receive(:quality=).with(item_double3.quality+1)
          gilded_rose3.update_quality
        end

        it 'lowers the item sell_in at the end of each day for Backstage passes' do
          allow(item_double3).to receive(:quality=){"Received"}
          expect(item_double3).to receive(:sell_in=).with(item_double3.sell_in-1)
          gilded_rose3.update_quality
        end

        it 'lowers the item 2 times for Backstage passes sell in below 11 above 6' do
          allow(item_double4).to receive(:sell_in=){"Received"}
          expect(item_double4).to receive(:quality=).with(item_double4.quality+1).exactly(2).times
          gilded_rose4.update_quality
        end

        it 'lowers the item 3 times for Backstage passes sell in below 6' do
          allow(item_double5).to receive(:sell_in=){"Received"}
          expect(item_double5).to receive(:quality=).with(item_double5.quality+1).exactly(3).times
          gilded_rose5.update_quality
        end

        it 'double decreases the quality of a conjured item' do
          allow(conjured_double).to receive(:sell_in=){"Received"}
          expect(conjured_double).to receive(:quality=).with(conjured_double.quality-1).exactly(2).times
          conjured_gilded_rose.update_quality
        end

        it ' increases the sell in of a conjured item at the same rate' do
          allow(conjured_double).to receive(:quality=){"Received"}
          expect(conjured_double).to receive(:sell_in=).with(conjured_double.sell_in-1)
          conjured_gilded_rose.update_quality
        end
      end

      context 'sell in < 0' do
        let(:item_double6){instance_double("Item", :name => 'Milk', :sell_in => -2, :quality => 4)}
        let(:item_double7){instance_double("Item", :name => 'Aged Brie', :sell_in => -2, :quality => 0)}
        let(:item_double8){instance_double("Item", :name => 'Backstage passes to a TAFKAL80ETC concert', :sell_in => -2, :quality => 40)}

        subject(:gilded_rose6){described_class.new([item_double6])}
        subject(:gilded_rose7){described_class.new([item_double7])}
        subject(:gilded_rose8){described_class.new([item_double8])}


        it 'decreases quality of milk twice as fast' do
          allow(item_double6).to receive(:sell_in=){"Received"}
          expect(item_double6).to receive(:quality=).with(item_double6.quality-1).exactly(2).times
          gilded_rose6.update_quality
        end

        it 'increases the quality of brie twice as quickly' do
          allow(item_double7).to receive(:sell_in=){"Received"}
          expect(item_double7).to receive(:quality=).with(item_double7.quality+1).exactly(2).times
          gilded_rose7.update_quality
        end
        it 'sets quality of passes to 0 past sell_in' do
          allow(item_double8).to receive(:sell_in=){"Received"}
          allow(item_double8).to receive(:quality=).with(41){"Received"}
          expect(item_double8).to receive(:quality=).with(item_double8.quality-item_double8.quality)
          gilded_rose8.update_quality
        end

        it 'double decreases the quality of a conjured item' do
          allow(conjured_double2).to receive(:sell_in=){"Received"}
          expect(conjured_double2).to receive(:quality=).with(conjured_double2.quality-1).exactly(4).times
          conjured_gilded_rose2.update_quality
        end
      end
    end
end
