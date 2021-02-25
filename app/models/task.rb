class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates :name, presence: true,
                      length: { maximum: 15 }

    validates :description, presence: true,
                            length: { minimum: 3, maximum: 500 }

    scope :completed, -> { where(completed: true) }
    scope :pending, -> { where(completed: false) }             
end
