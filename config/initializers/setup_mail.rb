    ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,    
      :user_name            => "herenand@gmail.com",  
      :password             => "bondwithbest",  
      :authentication       => "plain",  
      :enable_starttls_auto => true  
    }  
       