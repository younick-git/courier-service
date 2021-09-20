# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  enum service_type: %i[speed_post regular]
  enum payment_mode: %i[cod prepaid]
  enum status: %i[sent in_transit delivered]

  validates :service_type, presence: true
  validates :weight, presence: true
  validates :payment_mode, presence: true
  validates :service_cost, presence: true
  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  validate :users_validation
  def users_validation
    if sender_id == receiver_id
      self.errors[:base] << "Sender and receiver can't be same!!!"
    end
  end

  after_create do
    self.order_id = loop do
      random_id = SecureRandom.urlsafe_base64(nil, false)
      break random_id unless Order.exists?(id: random_id)
    end
    self.save!
  end
end
