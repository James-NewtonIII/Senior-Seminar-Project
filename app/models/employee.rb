class Employee < ApplicationRecord
    has_one :account, as: :accountable
    has_many :items
    has_many :taf_items
end
