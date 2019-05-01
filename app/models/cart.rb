class Cart < ApplicationRecord
   has_many :items, dependent: :destroy

    def add_item(item)
        current_item = items.build(id: item.id)
        
        current_item
    end

    def remove_item(item)
        item = item.find_by(item_id: item.id)
        item.quantity -= 1
        
        item
    end

    def total_expected_amount
        item.to_a.sum { |item| item.amount }
    end
end
