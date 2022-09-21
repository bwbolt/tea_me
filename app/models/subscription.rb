class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum active: %w[Inactive Active]
end
