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
    it 'nameが40文字以下の場合' do
      @item.name = 'アイウエオ'
      expect(@item).to be_valid
    end
    it 'category_idが1以外の場合' do
      @item.category_id = '2'
      expect(@item).to be_valid
    end
    it 'status_idが1以外の場合' do
      @item.status_id = '2'
      expect(@item).to be_valid
    end
    it 'deli_price_idが1以外の場合' do
      @item.deli_price_id = '2'
      expect(@item).to be_valid
    end
    it 'area_idが1以外の場合' do
      @item.area_id = '2'
      expect(@item).to be_valid
    end
    it 'deli_day_idが1以外の場合' do
      @item.deli_day_id = '2'
      expect(@item).to be_valid
    end
    it 'priceが半角数字の場合' do
      @item.price = '999'
      expect(@item).to be_valid
    end
    it 'priceが300~9999999の間の場合' do
      @item.price = '999'
      expect(@item).to be_valid
    end
  end

  numericality: { in: 300..9999999 }

  

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
      @item.password = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it '' do
      @item.password = '12345'
      @item.password_confirmation = '12345'
      @item.valid?
      expect(@item.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '' do
      @item.password = 'aaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '' do
      @item.password = '123456'
      @item.valid?
      expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '' do
      .firstname = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("First name can't be blank")
    end

    it '' do
      @item.lastname = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Last name can't be blank")
    end

    it '' do
      @item.firstname_kana = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
  end
end

image, 
:name,
 :explanation,
  :category_id,
   :status_id,
   :deli_price_id,
    :area_id,
     :deli_day_id,
      :price