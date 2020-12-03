require 'rails_helper'

RSpec.describe UserSettlement, type: :model do
  describe '#create' do
    before do
      @user_settlement = FactoryBot.build(:user_settlement)
    end

    context '商品購入がうまくいくとき' do
      it 'postalcodeとarea_idとmunicipalityとaddressとbuildingnameとtellとtokenが存在すれば登録できること' do
        expect(@user_settlement).to be_valid
      end
      it 'postalcodeにハイフンがあること' do
        @user_settlement.postalcode = '123-4567'
        expect(@user_settlement).to be_valid
      end
      it 'postalcodeが8桁なこと' do
        @user_settlement.postalcode = '123-4567'
        expect(@user_settlement).to be_valid
      end
      it 'area_idが1以外の場合' do
        @user_settlement.area_id = '2'
        expect(@user_settlement).to be_valid
      end
      it 'tellにハイフンがないこと' do
        @user_settlement.tell = '09012345678'
        expect(@user_settlement).to be_valid
      end
      it 'tellが11桁以下なこと' do
        @user_settlement.tell = '09012345678'
        expect(@user_settlement).to be_valid
      end
    end


    context '商品購入がうまくいかないとき' do
      it 'postalcodeが空では登録できないこと' do
        @user_settlement.postalcode = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Postalcode can't be blank")
      end

      it 'postalcodeにハイフンがないとき' do
        @user_settlement.postalcode = 1234567
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Postal code Input correctly can't be blank")
      end

      it 'area_idが1では登録できない' do
        @user_settlement.area_id = 1
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Prefecture Select")
      end

      it 'municipalityが空では登録できないこと' do
        @user_settlement.municipality = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @user_settlement.address = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'tellが空では登録できないこと' do
        @user_settlement.tell = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tellが数字のみの場合' do
        @user_settlement.tell = 09012345678
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Phone number Input only number")
      end

      it "tokenが空では登録できないこと" do
        @user_settlement.token = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end