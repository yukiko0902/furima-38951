require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context "商品出品できる場合" do
      it "すべてのデータが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    
    context "商品出品できない場合" do
      it "商品画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it "商品名が空だと登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it "商品名が40文字以上だと登録できない" do
        @item.item_name = 'テスト' *40
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name is too long (maximum is 40 characters)"
      end

      it "商品説明が1000文字以上だと登録できない" do
        @item.description_of_item = 'テスト' *1000
        @item.valid?
        expect(@item.errors.full_messages).to include "Description of item is too long (maximum is 1000 characters)"
      end

      it "カテゴリーが空では登録できない" do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end

      it "商品状態が空では登録できない" do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item state can't be blank"
      end

      it "配送料負担が空では登録できない" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end

      it "発送元地域が空では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "発送までの日数が空では登録できない" do
        @item.days_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to delivery can't be blank"
      end

      it "価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it "価格が半角数字ではないと登録できない" do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it "価格が300円以下では登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end  

      it "価格が9,999,999円以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it "ユーザーが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end

