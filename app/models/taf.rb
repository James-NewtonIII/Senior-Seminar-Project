class Taf < ApplicationRecord
    has_many :taf_line_items, dependent: :destroy
end
