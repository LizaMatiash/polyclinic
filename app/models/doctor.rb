class Doctor < ApplicationRecord
  VALIDATION = /^[0-9]{10}$/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :phone, :format, VALIDATION

  belongs_to :category, optional: true

  has_many :doctors_users, dependent: :destroy
  has_many :users, through: :doctors_users

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
