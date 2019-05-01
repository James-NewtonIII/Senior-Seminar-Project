class Item < ApplicationRecord
    #validates :expense_type, :amount, presence: true
    #validates :amount, numericality: {greater_than_or_equal_to: 0.01}
    belongs_to :employee, optional: true
    belongs_to :budget_approver, optional: true
    belongs_to :payment_manager, optional: true
    belongs_to :cart, optional: true
    
    #validates :image_url, allow_blank: true, format: {
    #    with:
    #    %r{\.(gif|jpg|png)\Z}i,
    #    message: 'must be a URL for GIF, JPG or PNG image.'
    #}
end
