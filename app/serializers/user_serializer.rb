class UserSerializer < ActiveModel::Serializer
  attributes :id, :age, :is_tall, :name, :email, :street_name

  def street_name
  	object.addresses&.first&.street
  end
end
