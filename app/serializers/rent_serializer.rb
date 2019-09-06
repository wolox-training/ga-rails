class RentSerializer < ActiveModel::Serializer
  attributes :rent_id,
             :user,
             :book,
             :rent_in,
             :rent_out
end
