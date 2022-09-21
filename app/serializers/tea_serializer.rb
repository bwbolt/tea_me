class TeaSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :brew_details
end
