class List < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tasks
  has_many :tags, through: :tasks
end
