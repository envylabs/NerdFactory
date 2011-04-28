class OrderMailer < ActionMailer::Base
  default :from => 'orders@nerdfactory.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.actionmailer.order_mailer.purchase_confirmation.subject
  #
  def purchase_confirmation(order)
    @order = order

    attachments['receipt.pdf'] = File.read(Rails.root.join('receipt.pdf'))

    @order.products.each do |p|
      attachments[p.picture.original_filename] = File.read(p.picture.path)
    end

    mail :to => @order.user.email
  end
end
