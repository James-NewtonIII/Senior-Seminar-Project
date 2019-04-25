class Item < ApplicationRecord
    validates :expense_type, :amount, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0.01}
    validates :image_url, allow_blank: true, format: {
        with:
        %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
    }

    has_many :line_items
    
    before_destroy :ensure_not_referenced_by_any_line_item

    def add_item(item)
        current_item = line_items.find_by(item_id: item.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(item_id: item.id)
        end
        current_item
    end

    private
        def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                errors.add(:base, 'Line Items present')
                throw :abort
            end
        end
end
