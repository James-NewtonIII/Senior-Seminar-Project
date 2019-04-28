class Taf < ApplicationRecord
    has_many :taf_items, dependent: :destroy

    def add_taf_item(taf_item)
        current_item = taf_items.build(id: taf_item.id)
        
        current_item
    end

    def remove_taf_item(taf_item)
        taf_item = taf_item.find_by(taf_item_id: taf_item.id)
        taf_item.quantity -= 1
        
        taf_item
    end

    def total_expected_amount
        taf_item.to_a.sum { |taf_item| taf_item.expected_amount }
    end

end
