json.extract! order, :id, :weight, :service_type, :service_cost, :payment_mode, :status, :sender_id, :receiver_id, :created_at, :updated_at
json.url order_url(order, format: :json)
