require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  context '内容に問題ない場合' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@order_address).to be_valid
    end
    it 'roomは空でも保存できること' do
      @order_address.room = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'deli_numが空だと保存できないこと' do
      @order_address.deli_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Deli num can't be blank")
    end
    it 'deli_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.deli_num = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Deli num is invalid. Include hyphen(-)")
    end
    it 'area_idを選択していないと保存できないこと' do
      @order_address.area_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'wardが空だと保存できないこと' do
      @order_address.ward = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Ward can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @order_address.block = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end
    it 'phoneが空だと保存できないこと' do
      @order_address.phone = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが10桁未満だと保存できないこと' do
      @order_address.phone = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end
    it 'phoneが12桁以上だと保存できないこと' do
      @order_address.phone = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end
    it 'phoneが数字以外を含むと保存できないこと' do
      @order_address.phone = '03-123-456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone is invalid")
    end
  end
end
