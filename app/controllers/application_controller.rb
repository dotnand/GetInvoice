class ApplicationController < ActionController::Base
  protect_from_forgery
    require 'active_admin_views_pages_base.rb'

	def current_cart
	  if session[:invoice_id]
		@current_invoice ||= Invoice.find(session[:invoice_id])
		session[:invoice_id] = nil if @current_invoice.purchased_at
	  end
	  @current_cart
	end


end
