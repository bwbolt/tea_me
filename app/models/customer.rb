class Customer < ApplicationRecord
  validates :email, uniqueness: true
  has_many :subscriptions
  has_many :teas, through: :subscriptions
end
