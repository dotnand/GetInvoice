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
        item.input :product, :as => :autocomplete, :url => "autocomplete_product_name"
        item.input :quantity
        item.input :total
      end
    end
   f.buttons
  end
  config.comments = false
    filter  :account
    filter :invoice_date
  show do
    attributes_table :id, :account , :invoice_date , :status , :shipping_cost, :discount,:tax, :total
  end
 controller do
    autocomplete :product, :name, :full => true
  end
end
