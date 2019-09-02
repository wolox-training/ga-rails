class BookSerializer < ActiveModel::Serializer
  attributes :id,
             :author,
             :image,
             :title,
             :publisher,
             :year
end
