require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @itemorder = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
    sleep(1)
  end  

  describe '商品の購入' do
    context '商品購入できる場合' do
      it 'すべての情報が正しく入力できていれば登録できる' do
        expect(@itemorder).to be_valid
      end  
      it '建物名が空でも購入できる' do
        @itemorder.building_name = ''
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
        @itemorder.prefecture_id = '1'
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Prefecture can't be blank")
      end  
      it '市区町村が空では購入できない' do
        @itemorder.city = ''
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("City can't be blank")
      end  
      it '番地が空では購入できない' do
        @itemorder.house_number = ''
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("House number can't be blank")
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
      it '電話番号が12桁以上では購入できない' do
        @itemorder.phone_num = '111122223333'
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Phone num is invalid. Include hyphen(-)")
      end  
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @itemorder.phone_num = '11112222３３３'
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Phone num is invalid. Include hyphen(-)")
      end  
      it 'tokenが空では購入できない' do
        @itemorder.token = nil
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Token can't be blank")
      end  
      it 'userが紐づいていないと購入できない' do
        @itemorder.user_id = nil
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("User can't be blank")
      end  
      it 'itemが紐づいていないと購入できない' do
        @itemorder.item_id = nil
        @itemorder.valid?
        expect(@itemorder.errors.full_messages).to include("Item can't be blank")
      end  
    end  
  end  
end
