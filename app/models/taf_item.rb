class TafItem < ApplicationRecord
    
    validates :request_reason, :expense_date, :estimated_amount, :dept, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0.01}

    before_destroy :ensure_not_referenced_by_any_line_item

end
