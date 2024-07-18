require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @itemorder = FactoryBot.build(:item_order)
  end  

  describe '商品の購入' do
    context '商品購入できる場合' do
      it 'すべての情報が正しく入力できていれば登録できる' do
        expect(@itemorder).to be_valid
      end  
    end  

    context '商品購入できない場合' do
      it '郵便番号が空では購入できない' do
        @itemorder.postal_code = ''
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Postal code can't be blank")
      end  
      it '郵便番号が「3桁ハイフン4桁」の半角文字列でないと購入できない' do
        @itemorder.postal_code = '123４567'
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end  
      it '都道府県が空では購入できない' do
        @itemorder.prefecture_id = nil
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Prefecture can't be blank")
      end  
      it '市区町村が空では購入できない' do
        @itemorder.city = ''
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("City can't be blank")
      end  
      it '電話番号が空では購入できない' do
        @itemorder.phone_num = ''
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Phone num can't be blank")
      end  
      it '電話番号は、10桁以上11桁以内の半角数字でないと購入できない' do
        @itemorder.phone_num = '12345678９'
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Phone num is invalid. Include hyphen(-)")
      end  
      it 'tokenが空では購入できない' do
        @itemorder.token = nil
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Token can't be blank")
      end  
    end  
  end  
end
