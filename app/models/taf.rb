class Taf < ApplicationRecord
    has_many :taf_line_items, dependent: :destroy
    has_many :taf_items, through: :taf_line_items
    accepts_nested_attributes_for :taf_items, reject_if: :all_blank, allow_destroy: true

    private

    def ensure_not_referenced_by_any_taf_line_item
        unless taf_line_items.empty?
            errors.add(:base, 'TAF Line Items present')
            throw :abort
        end
    end
end
