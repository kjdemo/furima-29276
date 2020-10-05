require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "必須項目があれば登録出来ること" do
      expect(@user).to be_valid
    end

    it "nick_nameが空では登録できないこと" do
      @user.nick_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは不正な値です")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "emailに@を含まない時に登録できないこと" do
      @user.email = "email"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "1234aa"
      @user.password_confirmation = "1234aa"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "123aa"
      @user.password_confirmation = "123aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "passwordに英語と数字混合でなければ登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(名)を入力してください")
    end

    it "first_nameが半角では登録できないこと" do
      @user.first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(名)は不正な値です")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(姓)を入力してください")
    end

    it "last_nameが半角では登録できないこと" do
      @user.last_name = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(姓)は不正な値です")
    end
    
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ふりがな名前(名)を入力してください")
    end

    it "first_name_kanaが半角では登録できないこと" do
      @user.first_name_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("ふりがな名前(名)は不正な値です")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ふりがな苗字(姓)を入力してください")
    end

    it "last_name_kanaが半角では登録できないこと" do
      @user.last_name_kana = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("ふりがな苗字(姓)は不正な値です")
    end


    it "birthdayが空では登録できないこと" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end