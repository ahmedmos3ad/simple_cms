class User < ApplicationRecord
    has_secure_password
    validates :username,:email, :password, presence:true, length:{within:5..20}
    validates :username,:email, uniqueness:true
end
