class TafItem < ApplicationRecord
    #validates :request_reason, :expense_date, :estimated_amount, :dept, presence: true
    validates :estimated_amount, numericality: {greater_than_or_equal_to: 0.01}
    belongs_to :employee
    belongs_to :budget_approver, optional: true
    belongs_to :taf, optional: true
    before_destroy :ensure_not_referenced_by_any_taf_line_item

    def add_taf_item(taf_item)
        current_item = taf_line_items.find_by(taf_item_id: taf_item.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = taf_line_items.build(taf_item_id: taf_item.id)
        end
        current_item
    end

end
