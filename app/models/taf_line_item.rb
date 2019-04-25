class TafLineItem < ApplicationRecord
    has_one :taf_item
    belongs_to :taf
end
