class Tea < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :brew_details, presence: true
  has_many :subscriptions
  has_many :customers, through: :subscriptions
end
