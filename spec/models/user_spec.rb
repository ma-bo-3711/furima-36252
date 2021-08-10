require 'rails_helper'

RSpec.describe User, type: :model do

    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do

    context '保存できる場合' do
      it 'name,email,passwordとpassword_confirmation,first_nameとlast_name,first_kanaとlast_kana,birthが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが６文字以上の英数字であれば登録できること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end

    context '空では登録できない場合' do
      it 'nameが空では登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    
      it 'first_kanaが空では登録できないこと' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
    
      it 'last_kanaが空では登録できないこと' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
    
      it 'birthが空では登録できないこと' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end

    context '空ではなく、保存できない場合' do
    
      it 'passwordが６文字以上の英語のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    
      it 'passwordが６文字以上の数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    
      it 'passwordが５文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが全角文字では登録できないこと' do
        @user.password = 'ヤマダさんn1'
        @user.password_confirmation = 'ヤマダさんn1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
      it 'emailに@が含まれていない場合、登録できないこと' do
        @user.email = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.first_name = '太郎123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
    
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.last_name = '山田123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
    
      it 'first_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end
    
      it 'last_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end
    end

  end
end
