class User < ApplicationRecord
  has_one :favoritelist, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,  presence: true , length: { in: 6..50 }
  validates :password_confirmation,
            presence: true,
            on: :create

  validates :password_confirmation,
            presence: true,
            on: :update,
            unless: lambda{ |u| u.password.blank? }

  validates :password,
            presence: true,
            confirmation: true,
            on: :create

  validates :password,
            on: :update,
            confirmation: true,
            unless: lambda{ |u| u.password.blank? }
end
