class Taf < ApplicationRecord
    has_many :taf_items, dependent: :destroy
    belongs_to :employee
    belongs_to :payment_manager, optional: true
    accepts_nested_attributes_for :taf_items, reject_if: :all_blank, allow_destroy: true

    private

    def ensure_not_referenced_by_any_taf_line_item
        unless taf_line_items.empty?
            errors.add(:base, 'TAF Line Items present')
            throw :abort
        end
    end
end
