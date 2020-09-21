require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "必須項目があれば登録出来ること" do
      expect(@item).to be_valid
    end

    it "商品名が空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空では登録できないこと" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "カテゴリーの情報が空では登録できないこと" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態の情報が空では登録できないこと" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "配送料の負担についての情報が空では登録できないこと" do
      @item.shipping_charges_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end

    it "発送元の地域についての情報が空では登録できないこと" do
      @item.item_address_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item address can't be blank")
    end

    it "発送までの日数についての情報が空では登録できないこと" do
      @item.days_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end

    it "価格が空では登録できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が半角数字でないと登録できないこと" do
      @item.price = "４００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "価格のが299以下のとき登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格が9,999,999以上のとき登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "出品したユーザーの情報が空では登録できないこと" do
      @item.user_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end
  end
end
