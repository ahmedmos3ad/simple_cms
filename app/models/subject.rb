class Subject < ApplicationRecord
    has_many :pages
    validates :name,:position, presence:true
    validates :name, uniqueness:true
    validates :visible, inclusion: { in: [ true, false ] }
end
