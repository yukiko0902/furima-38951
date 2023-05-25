require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  before do
    @buy_delivery = FactoryBot.build(:buy_delivery)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'すべてのデータが存在すれば購入できる' do
        expect(@buy_delivery).to be_valid
      end

      it 'user_idが空でなければ購入できる' do
        @buy_delivery.user_id = 1
        expect(@buy_delivery).to be_valid
      end

      it 'item_idが空でなければ購入できる' do
        @buy_delivery.item_id = 1
        expect(@buy_delivery).to be_valid
      end

      it '建物名が空でも購入できる' do
        @buy_delivery.building_name= ""
        expect(@buy_delivery).to be_valid
      end
    end

    context '商品購入できない場合' do
      it '郵便番号が空では購入できない' do
        @buy_delivery.postcode= ""
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号に(-)がなければ購入できない' do
        @buy_delivery.postcode = "1234567"
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode is invalid")
      end

      it '郵便番号が7桁でなければ購入できない' do
        @buy_delivery.postcode = "123-456"
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode is invalid")
      end

      it '都道府県が空では購入できない' do
        @buy_delivery.prefecture_id = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では購入できない' do
        @buy_delivery.municipality = ""
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では購入できない' do
        @buy_delivery.address = ""
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @buy_delivery.telephone_number = ""
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号は10桁以上11桁以内の半角数値のみでないと購入できない' do
        @buy_delivery.telephone_number = "090-123-456"
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'tokenが空では購入できないこと' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
