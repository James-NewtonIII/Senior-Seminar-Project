json.extract! taf_item, :id, :request_reason, :expense_date, :estimated_amount, :dept, :ba_approval, :ba_reason, :created_at, :updated_at
json.url taf_item_url(taf_item, format: :json)
