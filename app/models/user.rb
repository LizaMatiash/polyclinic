class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true

  has_many :doctors_users, dependent: :destroy
  has_many :doctors, through: :doctors_users

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
