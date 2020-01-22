class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :number, :neighborhood, :user_id
end
