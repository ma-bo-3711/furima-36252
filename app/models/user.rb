class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true do
    # presence:trueのみ適用されるカラムを書き出す
      validates :name
      validates :birth
    
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      # 「presence:true」かつ「漢字カタカナひらがなの正規表現が適用される」カラムを書き出す 
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶ]+\z/} do
      # 「presence:true」かつ「カタカナの正規表現が適用される」カラムを書き出す
      validates :first_kana
      validates :last_kana
    end
  end

end
