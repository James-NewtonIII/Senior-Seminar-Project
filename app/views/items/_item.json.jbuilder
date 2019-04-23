json.extract! item, :id, :expense_type, :amount, :ba_approval, :ba_reason, :image_url, :created_at, :updated_at
json.url item_url(item, format: :json)
