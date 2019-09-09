class RentSerializer < ActiveModel::Serializer
  attributes :user,
             :book,
             :rent_in,
             :rent_out
end
