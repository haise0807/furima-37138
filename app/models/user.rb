class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

    validates :password, format: { with: VALID_PASSWORD_REGEX, allow_blank: true}

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,allow_blank: true }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/,allow_blank: true }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/,allow_blank: true }
    validates :birth_date
  end

  has_many :items

end
