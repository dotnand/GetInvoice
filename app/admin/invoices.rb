ActiveAdmin.register Invoice do
  action_item :only => :show do
    link_to "View Invoice", user_payment_payment_notifications_path(:id => invoice), :target => '_blank'
    
  end 
  action_item :only => :show do
    link_to "Send To User", "#", :def_ref => "send_user", :id => "opener"
  end
  index do
    column :id, :sortable => :id do |invoice|
      link_to invoice.id, admin_invoice_path(invoice)
    end
    column  :account
    column :invoice_date
    column :status
    #column :shipping_cost
    #column :discount
    column :tax
    column :total
    #default_actions
  end
  form do |f|
    f.inputs "Details" do
      f.input :account
      f.input :invoice_date
      f.input :status,  :as => :select, :collection => ["Received", "Pending", "Return", "Aproved"]
      #f.input :shipping_cost
      #f.input :discount
      f.input :tax
      f.input :creator_id, :as => :hidden, :value => current_user.id
    end
    f.has_many :line_items do |item|
      item.inputs "Item" do
        item.input :product, :input_html => { :class => 'select_product' }
		item.input :unit_price , :input_html => { :class => 'unit_price_col can_change_col' } 
        item.input :quantity, :input_html => { :class => 'quantity_col can_change_col'} 
        item.input :total, :input_html => { :class => 'total_col' ,:readonly  => true} 
      end
    end
   f.buttons
  end
  config.comments = false
    filter  :account
    filter :invoice_date
  show do
    attributes_table :id, :account , :invoice_date , :status , :shipping_cost,:tax, :total
  
    attributes_table_for invoice do
      row("Grand Total") { invoice.grand_total }
    end
    panel "Items" do
      table_for invoice.line_items do
        column :product 
        column "unit_price" do |item|
          item.product.unit_price
        end
        column :quantity
        column :total
      end
    end
    div do
        render "send_to_user"
    end
  end
  controller do
    def send_to_user
     massage = Massage.new(params[:massage])
     invoice = Invoice.find(massage.invoice_id)
     massage.account_id = invoice.account_id
     massage.admin_user_id = current_user.id
      if massage.save
        redirect_to :back, :notice => "Send user successfully"
      else 
        redirect_to :back, :alert => "Error on sending mail Please contact dotnand@gmail.com"
      end
    end
  end
end
