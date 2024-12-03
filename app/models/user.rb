class User < ApplicationRecord
  validates :name, presence: true


  has_many :orders
  has_many :products, through: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
