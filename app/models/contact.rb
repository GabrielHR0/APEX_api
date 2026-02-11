class Contact < ApplicationRecord
    
    validates :name, :message, presence: true
    validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}

end
