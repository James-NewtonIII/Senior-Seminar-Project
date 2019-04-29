class TafItem < ApplicationRecord
    #validates :request_reason, :expense_date, :estimated_amount, :dept, presence: true
    #validates :estimated_amount
    belongs_to :employee, optional: true
    belongs_to :budget_approver, optional: true
    belongs_to :payment_manager, optional: true
    belongs_to :taf, optional: true
end
