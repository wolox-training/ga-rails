class Book < ApplicationRecord
  validates :genre,
            :author,
            :image,
            :title,
            :publisher,
            :year,
            presence: true

  validates :title, length: { maximum: 25 }
end
