class User < ApplicationRecord
  has_paper_trail
  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self
end
