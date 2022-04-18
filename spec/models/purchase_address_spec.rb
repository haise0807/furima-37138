require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end
  describe '商品購入情報の登録' do
    context '商品購入ができるとき' do
      it 'post_code, city, house_number, phone_number, prefecture_id,purchase_id, tokenが存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end

      it 'post_codeは、「3桁ハイフン4桁」の半角文字列だと登録できる' do
        @purchase_address.post_code = '123-4567'
        expect(@purchase_address).to be_valid
      end

      it 'phone_numberは、10桁以上11桁以内の半角数値だと登録できる' do
        @purchase_address.phone_number = '00012345678'
        expect(@purchase_address).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'post_codeが空だと登録できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'cityが空だと登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと登録できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'prefecture_idが空だと登録できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'tokenが空だと登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeは、半角のハイフンを含んだ正しい形式でないと登録できない' do
        @purchase_address.post_code = '1234-567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'phone_numberは、10桁以上11桁以内の半角数値でないと登録できない' do
        @purchase_address.phone_number = '０００１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
