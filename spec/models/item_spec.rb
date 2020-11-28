require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it 'imageとnameとexplanationとcategory_idとstatus_idとdeli_price_idとarea_idとdeli_day_idとpriceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
      it 'explanationが40文字以下の場合' do
        @item.name = 'アイウエオ'
        expect(@item).to be_valid
      end
      it 'category_idが1以外の場合' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'status_idが1以外の場合' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'deli_price_idが1以外の場合' do
        @item.deli_price_id = 2
        expect(@item).to be_valid
      end
      it 'area_idが1以外の場合' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it 'deli_day_idが1以外の場合' do
        @item.deli_day_id = 2
        expect(@item).to be_valid
      end
      it 'priceが半角数字の場合' do
        @item.price = 999
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の間の場合' do
        @item.price = 999
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationが空では登録できないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'status_idが1では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end

      it 'deli_price_idが1では登録できない' do
        @item.deli_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deli price Select')
      end

      it 'area_idが1では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end

      it 'deli_day_idが1では登録できない' do
        @item.deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deli day Select')
      end

      it 'priceは半角数字以外では登録できない' do
        @item.price = 'イチ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは299以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceは10000000以上ではでは登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceは300~9999999の間でなければ登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
