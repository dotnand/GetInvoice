ActiveAdmin.register Invoice do
  index do
    column :id, :sortable => :id do |invoice|
      link_to invoice.id, admin_invoice_path(invoice)
    end
    column  :account
    column :invoice_date
    column :status
    column :shipping_cost
    column :discount
    column :tax
    column :total
    #default_actions
  end
  form do |f|
    f.inputs "Details" do
      f.input :account
      f.input :invoice_date
      f.input :status,  :as => :select, :collection => ["Received", "Pending", "Return", "Aproved"]
      f.input :shipping_cost
      f.input :discount
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
    attributes_table :id, :account , :invoice_date , :status , :shipping_cost, :discount,:tax, :total
  
	attributes_table_for invoice do
		dis = invoice.total.to_f - (invoice.total.to_f* invoice.discount.to_f/100)
		tax = dis + (dis * invoice.tax.to_f/100)
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

  end
 #controller do
  #  autocomplete :product, :name, :full => true, :value => [:id]
  #end
end
