class Subject < ApplicationRecord
    has_many :pages
    validates :name, :visible, :position, presence:true
end
