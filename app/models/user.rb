class User < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :categories, through: :questions
    has_many :comments
    has_many :commented_posts, through: :comments, source: :question

    has_secure_password

    validates :email, uniqueness: true 
    validates :username, :email, presence: true 

    scope :ordered_by_username, -> {order(username: :asc)}

    
    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end

end
