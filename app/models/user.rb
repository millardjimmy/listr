class User < ApplicationRecord
    has_many :categories
    has_many :lists, through: :categories
    has_many :tasks, through: :lists
    has_secure_password

    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
end
