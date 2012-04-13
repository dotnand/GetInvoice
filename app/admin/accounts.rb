ActiveAdmin.register Account do
  index do
    column  :display_name, :sortable => :display_name  do  | account|
      link_to account.display_name, admin_account_path(account)
    end
    column :email
    column :phone
    column :address
    column :created_at
  end
  form do |f|
    f.inputs "Details" do
      f.input :display_name
      f.input :email
      f.input :phone
      f.input :address
      f.input :admin_user_id, :as => :hidden, :value => current_user.id
    end
    f.buttons
  end
  filter :display_name
  filter :email
  config.comments = false
end