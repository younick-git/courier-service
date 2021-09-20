# frozen_string_literal: true
class OrderIdGenerator
  def self.get_order_id
    loop do
      random_id = SecureRandom.urlsafe_base64(nil, false)
      break random_id unless Order.exists?(order_id: random_id)
    end
  end
end
