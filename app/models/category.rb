class Category < ApplicationRecord
    has_many :questions, dependent: :destroy
    validates :name, presence: :true 
    validates_uniqueness_of :name, message: "that category has already been created."

    def self.most_popular
        self.all.sort_by{|c|c.questions.count}.reverse[0..2]
        #sort by question count
      end
    
end
