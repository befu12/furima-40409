require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end  

  describe '商品出品の登録' do
    context '商品出品の登録できる場合' do
      it 'すべての情報が正しく入力できていれば登録できる' do
        expect(@item).to be_valid
      end  
    end

    context '商品出品の登録できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end  
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end  
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end  
      it 'category_idが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end  
      it 'condition_idが未選択では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end  
      it 'burden_idが未選択では登録できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end  
      it 'prefecture_idが未選択では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end  
      it 'estimate_idが未選択では登録できない' do
        @item.estimate_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimate can't be blank")
      end  
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end  
      it 'priceは、半角数字を入力しないと登録できない' do
        @item.price = '1234５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end  
      it 'priceが300未満の場合は登録できない' do
        @item.price = 229
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end  
      it 'priceが10000000の場合は登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end  
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end  
    end  
  end  
end
