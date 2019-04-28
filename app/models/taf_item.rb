class TafItem < ApplicationRecord
    #validates :request_reason, :expense_date, :estimated_amount, :dept, presence: true
    validates :estimated_amount, numericality: {greater_than_or_equal_to: 0.01}
    belongs_to :employee
    belongs_to :budget_approver, optional: true
    belongs_to :payment_manager, optional: true
    belongs_to :taf, optional: true
end
