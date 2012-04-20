class PaymentNotificationsController < ApplicationController
protect_from_forgery :except => [:create]
  def index
    PaymentNotification.create!(:params => params, :invoice_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
	render :nothing => true
  end

  def show
    @payment_notification = PaymentNotification.find(params[:id])
  end

  def new
    @payment_notification = PaymentNotification.new
  end

def create
  PaymentNotification.create!(:params => params, :invoice_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
  render :nothing => true
end

def user_payment
	@invoice = Invoice.last
end

  def edit
    @payment_notification = PaymentNotification.find(params[:id])
  end

  def update
    @payment_notification = PaymentNotification.find(params[:id])
    if @payment_notification.update_attributes(params[:payment_notification])
      redirect_to @payment_notification, :notice  => "Successfully updated payment notification."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @payment_notification = PaymentNotification.find(params[:id])
    @payment_notification.destroy
    redirect_to payment_notifications_url, :notice => "Successfully destroyed payment notification."
  end
end
