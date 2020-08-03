class Category < ApplicationRecord
    has_many :questions
    validates :name, presence: :true 
    validates_uniqueness_of :name, message: "that category has already been created."

#write in SQL term - join with questions table ORDER|GROUP|COUNT
    def self.most_popular_cat
        self.all.sort_by {|cat| cat.category.count}
    end
    
end
