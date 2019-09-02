class BookSerializer < ActiveModel::Serializer
  attributes :author,
             :image,
             :title,
             :publisher,
             :year
end
