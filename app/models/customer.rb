class Customer < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  has_many :subscriptions
  has_many :teas, through: :subscriptions
end
