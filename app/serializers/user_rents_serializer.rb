class UserRentSerializer < ActiveModel::Serializer
  attributes :rent_in, :rent_out
  has_one :book, serializer: BookSerializer
end
