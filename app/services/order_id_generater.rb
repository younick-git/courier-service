# frozen_string_literal: true
class OrderIdGenerater
  def self.get_order_id(order)
    loop do
      random_id = SecureRandom.urlsafe_base64(nil, false)
      break random_id unless Order.exists?(id: random_id)
    end
  end
end
