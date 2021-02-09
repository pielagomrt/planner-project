class Category < ApplicationRecord
    validates :title, presence: true,
                      length: { maximum: 15 }
    validates :description, presence: true,
                            length: { minimum: 3, maximum: 500 }
end
