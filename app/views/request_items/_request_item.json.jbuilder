json.extract! request_item, :id, :expense_type, :amount, :reason, :ba_approval, :ba_reason, :created_at, :updated_at
json.url request_item_url(request_item, format: :json)
