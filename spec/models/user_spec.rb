require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上かつ半角英数字を混合していれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）だと登録できる" do
        @user.first_name = "やマ田"
        expect(@user).to be_valid
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）だと登録できる" do
        @user.last_name = "太ろウ"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角（カタカナ）だと登録できる" do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it "last_name_kanaが全角（カタカナ）だと登録できる" do
        @user.last_name_kana = "タロウ"
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "emailに@を含まないと登録できない" do
        @user.email = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下だと登録できない" do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数字を混合しないと登録できない" do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = '１２ａｂ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = '12ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "last_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.last_name_kana = '12ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "birth_dateが空だと登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
