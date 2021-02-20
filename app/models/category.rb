class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks

    validates :name, presence: true,
                      length: { maximum: 15 }
    
    
end
