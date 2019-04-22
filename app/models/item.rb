class Item < ApplicationRecord
    validates :expense_type, :amount, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0.01}
    validates :image_url, allow_blank: true, format: {
        with:
        %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
    }
end
