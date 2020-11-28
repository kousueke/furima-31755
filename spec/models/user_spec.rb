require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとfirstnameとlastnameとfirstname_kanaとlastname_kanaとbithdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ半角英数混合であれば登録できる' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123456'
        expect(@user).to be_valid
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）で入力されている場合登録できる' do
        @user.firstname = '青山'
        expect(@user).to be_valid
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）で入力されている場合登録できる' do
        @user.lastname = '太郎'
        expect(@user).to be_valid
      end
      it 'firstname_kanaが全角（カタカナ）で入力されていない場合登録できる' do
        @user.firstname_kana = 'アオヤマ'
        expect(@user).to be_valid
      end
      it 'lastname_kanaが全角（カタカナ）で入力されていない場合登録できる' do
        @user.lastname_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'firstnameが空では登録できないこと' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'lastnameが空では登録できないこと' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'firstname_kanaが空では登録できないこと' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it 'lastname_kanaが空では登録できないこと' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end

      it 'bithdayが空では登録できないこと' do
        @user.bithday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Bithday can't be blank")
      end
      it 'firstnameは全角（漢字・ひらがな・カタカナ）で入力されていない場合登録できない' do
        @user.firstname = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname Full-width characters')
      end
      it 'laststnameは全角（漢字・ひらがな・カタカナ）で入力されていない場合登録できない' do
        @user.lastname = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname Full-width characters')
      end
      it 'firstname_kanaは全角（カタカナ）で入力されていない場合登録できない' do
        @user.firstname_kana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana Full-width katakana characters')
      end
      it 'lastname_kanaは全角（カタカナ）で入力されていない場合登録できない' do
        @user.lastname_kana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana Full-width katakana characters')
      end
    end
  end
end
