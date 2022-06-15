class User < ApplicationRecord
    has_secure_password
    # validates :username, :password, presence:true, length:{within:5..10}
    # validates :username, uniqueness:true
end
