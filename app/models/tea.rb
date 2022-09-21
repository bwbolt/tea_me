class Tea < ApplicationRecord
  validates :title, uniqueness: true
  has_many :subscriptions
  has_many :customers, through: :subscriptions
end
