json.extract! shopper, :id, :name, :loyalty, :department, :nord_shopper_id, :created_at, :updated_at
json.styles shopper.styles
json.memos shopper.memos
json.url shopper_url(shopper, format: :json)
