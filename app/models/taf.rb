class Taf < ApplicationRecord
    has_many :taf_items, dependent: :destroy
    accepts_nested_attributes_for :taf_items, reject_if: :all_blank, allow_destroy: true
    belongs_to :employee
    belongs_to :budget_approver, optional: true
    belongs_to :payment_manager, optional: true
end
