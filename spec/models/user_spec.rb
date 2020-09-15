require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "必須項目があれば登録出来ること" do

    end

    it "nick_nameが空では登録できないこと" do

    end

    it "emailが空では登録できないこと" do

    end

    it "passwordが空では登録できないこと" do

    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do

    end

    it "first_nameが空では登録できないこと" do

    end

    it "last_nameが空では登録できないこと" do

    end

    it "first_name_kanaが空では登録できないこと" do

    end

    it "first_name_kanaが空では登録できないこと" do

    end

    it "birthdayが空では登録できないこと" do

    end

    it "重複したemailが存在する場合登録できないこと" do
      
    end

    it "emailに@が含まれていなければ登録できないこと"

    end

    it "passwordが6文字以上であれば登録できること" do

    end

    it "passwordが5文字以下であれば登録できないこと" do

    end

    it "passwordに英語と数字混合でなければ登録できないこと" do

    end
  end
end