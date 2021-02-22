class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates :name, presence: true,
                      length: { maximum: 15 }

    validates :description, presence: true,
                            length: { minimum: 3, maximum: 500 }

    # validate :past_date_invalid

    scope :completed, -> { where(completed: true) }
    scope :incomplete, -> { where(completed: false) }
    
    
    # def past_date_invalid
    #   if date.present? && date < Date.today
    #   errors.add(:date, " cannot be in the past")
    #   end
    # end                 
end
