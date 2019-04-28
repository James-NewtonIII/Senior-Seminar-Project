class Cart < ApplicationRecord
    has_many :items, dependent: :destroy
    belongs_to :employee
    belongs_to :budget_approver, optional: true
    belongs_to :payment_manager, optional: true
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
end
