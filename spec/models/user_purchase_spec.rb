require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '商品購入' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end
    
    it "必須項目があれば登録出来ること" do
      expect(@user_purchase).to be_valid
    end

    it "郵便番号が空では登録できないこと" do
      @user_purchase.postcode = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("郵便番号を入力してください")
    end

    it "it 郵便番号にハイフンがないと登録できないこと" do
      @user_purchase.postcode = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("郵便番号は（-）が必須です")
    end

    it "都道府県の情報が空では登録できないこと" do
      @user_purchase.prefecture_id = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("都道府県を入力してください")
    end

    it "prefecture_idが1では登録できないこと" do
      @user_purchase.prefecture_id = "1"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("都道府県は--以外の値にしてください")
    end

    it "市区町村が空では登録できないこと" do
      @user_purchase.city = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("市区町村を入力してください")
    end

    it "番地が空では登録できないこと" do
      @user_purchase.address = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("番地を入力してください")
    end

    it "電話番号が空では登録できないこと" do
      @user_purchase.phone_number = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("電話番号を入力してください")
    end

    it "電話番号が12桁以上のとき登録できないこと" do
      @user_purchase.phone_number = "0901234567890"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end

    it "電話番号が全角のとき登録できないこと" do
      @user_purchase.phone_number = "０９０１２３４５６７８"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("電話番号は半角で入力してください")
    end

    it "トークンが空では登録できないこと" do
      @user_purchase.token = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("カード情報を入力してください")
    end
  end

end