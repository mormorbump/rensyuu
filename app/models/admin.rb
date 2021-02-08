class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :address_admin
  # has_many :items

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_n_k
    validates :first_n_k
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_n_k
    validates :family_n_k
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :family_name
    validates :first_name
  end
end

