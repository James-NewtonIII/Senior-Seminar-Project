class RequestItem < ApplicationRecord
    validates :expense_type, :amount, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0.01}

    has_many :line_items


    before_destroy :ensure_not_referenced_by_any_line_item
end
