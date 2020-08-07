class Category < ApplicationRecord
    has_many :questions, dependent: :destroy
    validates :name, presence: :true 
    validates_uniqueness_of :name, message: "that category has already been created."


    
end
