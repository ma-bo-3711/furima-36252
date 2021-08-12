require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品できる場合' do
    it 'name , text , category_id , status_id , charge_id , area_id , indication_id , price , imageがあれば出品できること'do
    expect(@item).to be_valid
    end
  end

  context '空欄があって出品できない場合' do
    it 'nameが空では登録できないこと'do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空では登録できないこと'do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'category_idが空では登録できないこと'do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idが空では登録できないこと'do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'charge_idが空では登録できないこと'do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end

    it 'area_idが空では登録できないこと'do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'indication_idが空では登録できないこと'do
      @item.indication_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Indication can't be blank")
    end

    it 'priceが空では登録できないこと'do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'imageが空では登録できないこと'do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end

  context '空欄がなくて出品できない場合' do
    it 'category_idが1(---)の場合'do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが1(---)の場合'do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'charge_idが1(---)の場合'do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge must be other than 1")
    end

    it 'area_idが1(---)の場合'do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end

    it 'indication_idが1(---)の場合'do
      @item.indication_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Indication must be other than 1")
    end

    it 'priceが300未満の場合'do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが9,999,999を超える場合'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it 'priceが全角数字では登録できないこと'do
      @item.price = "５５５５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceが半角英数字混合では登録できないこと'do
      @item.price = "200yen"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end

  end
end
