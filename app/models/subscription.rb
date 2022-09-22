class Subscription < ApplicationRecord
  validates :frequency, presence: true
  belongs_to :customer
  belongs_to :tea

  enum active: %w[Inactive Active]
end
