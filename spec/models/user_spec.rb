require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmation、name_first、name_last、name_first_reading、name_last_reading、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end  
    end  

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end  
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end 
      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end  
      it 'emailで@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end  
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end  
      it 'passwordが6文字未満では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end  
      it 'passwordで半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字の混合である必要があります")
      end  
      it '' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字の混合である必要があります")
      end  
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '12345６'
        @user.password_confirmation = '12345６'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字の混合である必要があります")
      end  
      it 'お名前(全角)は、名字が空では登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank", "Name first 全角文字を使用してください")
      end  
      it 'お名前(全角)は、名前が空では登録できない' do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank", "Name last 全角文字を使用してください")
      end  
      it 'お名前(全角)は、名字を全角(漢字・ひらがな・カタカナ)で入力しないと登録できない' do
        @user.name_first = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first 全角文字を使用してください')
      end  
      it 'お名前(全角)は、名前を全角(漢字・ひらがな・カタカナ)で入力しないと登録できない' do
        @user.name_first = 'ｱﾝﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first 全角文字を使用してください')
      end  
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @user.name_first_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first reading can't be blank")
      end  
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.name_last_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last reading can't be blank")
      end  
      it 'お名前カナ(全角)は、名字を全角(カタカナ)で入力しないと登録できない' do
        @user.name_first_reading = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first reading 全角カタカナを使用してください')
      end
      it 'お名前カナ(全角)は、名前を全角(カタカナ)で入力しないと登録できない' do
        @user.name_last_reading = 'ｱﾝﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name last reading 全角カタカナを使用してください')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end  
    end  
  end  
end
