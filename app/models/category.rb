class Category < ApplicationRecord
  belongs_to :user
  has_many :lists
  has_many :tasks, through: :lists
end
