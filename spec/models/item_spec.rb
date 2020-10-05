require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/files/test_image.png")
    end

    it "必須項目があれば登録出来ること" do
      expect(@item).to be_valid
    end

    it "商品名が空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it "商品の説明が空では登録できないこと" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it "カテゴリーの情報が空では登録できないこと" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end

    it "商品の状態の情報が空では登録できないこと" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end

    it "配送料の負担についての情報が空では登録できないこと" do
      @item.shipping_charge_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end

    it "発送元の地域についての情報が空では登録できないこと" do
      @item.item_address_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end

    it "発送までの日数についての情報が空では登録できないこと" do
      @item.days_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end

    it "価格が空では登録できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end

    it "価格が半角数字でないと登録できないこと" do
      @item.price = "４００"
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end

    it "価格のが299以下のとき登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
    end

    it "価格が9,999,999以上のとき登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
    end

    it "商品名が41文字以上のとき登録できないこと" do
      @item.name = "あああああああああああああああああああああああああああああああああああああああああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
    end
  
    it "商品の説明が1001文字以上のとき登録できないこと" do
      @item.text = "ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいう"
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
    end

    it "category_idが1では登録できないこと" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは--以外の値にしてください")
    end

    it "status_idが1では登録できないこと" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は--以外の値にしてください")
    end

    it "item_iddress_idが1では登録できないこと" do
      @item.item_address_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域は--以外の値にしてください")
    end

    it "days_to_ship_idが1では登録できないこと" do
      @item.days_to_ship_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は--以外の値にしてください")
    end

    it "shipping_charge_idが1では登録できないこと" do
      @item.shipping_charge_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は--以外の値にしてください")
    end

    it "画像が空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("出品画像を入力してください")
    end
  end
end
