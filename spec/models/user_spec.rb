require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべてのデータが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailと重複するデータが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@がないと登録できない' do
        @user.email = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameは全角（ひらがな・漢字・かたかな）以外は登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameは全角（ひらがな・漢字・かたかな）以外は登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'last_name_kanacharactersが空では登録できない' do
        @user.last_name_kanacharacters = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanacharacters can't be blank"
      end
      it 'last_name_kanacharactersは全角カナ以外は登録できない' do
        @user.last_name_kanacharacters = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kanacharacters is invalid'
      end

      it 'first_name_kanacharactersが空では登録できない' do
        @user.first_name_kanacharacters = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanacharacters can't be blank"
      end
      it 'first_name_kanacharactersは全角カナ以外は登録できない' do
        @user.first_name_kanacharacters = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kanacharacters is invalid'
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc124'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが文字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordに全角文字があると登録できない' do
        @user.password = 'あああ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
    end
  end
end
