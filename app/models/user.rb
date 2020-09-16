class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nick_name
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name, format: { with: NAME_REGEX }
    KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :first_name_kana, format: { with: KANA_REGEX}
    validates :last_name_kana, format: { with: KANA_REGEX}
    validates :birthday
  end
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 },format: { with: PASSWORD_REGEX}
end
