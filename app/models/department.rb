class Department < ApplicationRecord
    has_one :budget_approver
end
