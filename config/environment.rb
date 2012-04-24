# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Getinvoice::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,    
      :user_name            => "herenand@gmail.com",  
      :password             => "bondwit",  
      :authentication       => "plain",  
      :enable_starttls_auto => true  
    }  

