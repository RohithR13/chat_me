class Administrator < ApplicationRecord
 
  has_secure_password
  

  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable
 
  attr_accessor :remember_token, :remember_token_expires_at
end

