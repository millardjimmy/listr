class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user
  belongs_to :tag
  has_many :comments
  has_many :commented_tasks, through:comments, :source: :tasks
end
