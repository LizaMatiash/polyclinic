class Doctor < ApplicationRecord
  # VALIDATION = /^[0-9]{10}$/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates_format_of :phone, with: /\A^[0-9]{10}\z/, on: :create

  belongs_to :category, optional: true

  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
