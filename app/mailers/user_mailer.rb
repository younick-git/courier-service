class UserMailer < ApplicationMailer
  def send_order_email
    @order = params[:order]
    @url = params[:host] + "/orders?order_id=#{@order.order_id}"
    mail(to: [@order.sender.email, @order.receiver.email], subject: 'Order Details')
  end

  def send_updated_order_email
    @order = params[:order]
    @url = params[:host] + "/orders?order_id=#{@order.order_id}"
    mail(to: [@order.sender.email, @order.receiver.email], subject: 'Order Details')
  end
end
