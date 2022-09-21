class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :active, :frequency, :customer_id, :tea_id
end
