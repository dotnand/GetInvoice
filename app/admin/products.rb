ActiveAdmin.register Product do
 # action_item do
  #  link_to "View Site", "/"
  # end
  index do
    column :id
    column :name, :sortable => :name do |product|
      link_to product.name, admin_product_path(product)
    end
    column  :unit_price 
    column :brand
    column :key
    column :quantity
    column :created_at
    column :comments, :sortable => false
    #default_actions
  end
    form do |f|
      f.inputs "Details" do
        f.input :name
        f.input :unit_price
        f.input :brand
        f.input :key
        f.input :quantity
        f.input :comments
      end
      f.buttons
    end
    config.comments = false
    filter :name
    filter :brand
    filter :key
    filter :created_at
end
