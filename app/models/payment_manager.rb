class PaymentManager < ApplicationRecord
    has_one :account, as: :accountable
    has_many :carts
    has_many :tafs
end
