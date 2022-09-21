class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :frequency, :customer_id, :tea_id
end
