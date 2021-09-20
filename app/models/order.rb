# frozen_string_literal: true
require 'order_id_generator'

class Order < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  enum service_type: %i[speed_post regular]
  enum payment_mode: %i[cod prepaid]
  enum status: {
    sent: 0,
    in_transit: 1,
    delivered: 2,
  }

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
    self.order_id = OrderIdGenerator.get_order_id
    self.save!
  end

  before_save do
    if self.class.statuses[status] < self.class.statuses[status_was]
      self.errors[:base] << "Invalid Status!!!"
      raise_validation_error
    end
  end
end
