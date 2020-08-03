class User < ApplicationRecord
    has_many :categories
    has_many :lists, through: :categories
    has_many :tasks, through: :lists
end
