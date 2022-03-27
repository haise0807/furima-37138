require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが必須である" do
      @user.nickname = ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Nickname can't be brank")
    end

    # it "emailが必須である" do
    #   @user.email = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Email can't be blank")
    # end

    # it "emailが一意性である" do
    # end

    # it "emailは、@を含む必要がある" do
    #   @user.email = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Email can't be blank")
    # end

    # it "passwordが必須である" do
    #   @user.password = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Password can't be blank")
    # end

    # it "passwordは、6文字以上での入力が必須である" do
    #   @user.password = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    # end

    # it "passwordは、半角英数字混合での入力が必須である" do
    #   @user.password = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Password is invalid")
    # end

    # it "passwordとpassword_confirmationは、値の一致が必須である" do
    #   @user.password = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    # end

    # it "お名前(全角)は、first_nameとlast_nameがそれぞれ必須である" do
    #   @user.first_name.last_name = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("First name can't be blank","Last name can't be blank")
    # end

    # it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須" do
    #   @user.first_name.last_name = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("First name is invalid","Last name is invalid")
    # end

    # it "お名前カナ(全角)は、first_name_kanaとlast_name_kanaがそれぞれ必須である" do
    #   @user.first_name_kana.last_name_kana = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("First name kana can't be blank","Last name kana can't be blank")
    # end

    # it "お名前カナ(全角)は、全角（カタカナ）での入力が必須である" do
    #   @user.first_name_kana.last_name_kana = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("First name kana is invalid","Last name kana is invalid")
    # end

    # it "birth_dateが必須である" do
    #   @user. = 'birth_date'
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Birth date can't be blank")
    # end
  end
end
