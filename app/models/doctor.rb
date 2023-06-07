class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true

  belongs_to :category, optional: true

  has_many :doctros_users, dependent: :destroy
  has_many :users, through: :doctros_users

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
