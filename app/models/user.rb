class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    validates :username, presence: true
    validates :username, uniqueness: true, length: { in: 1..20 }

    scope :other_users, -> (user_id) { where.not(id: user_id).order(username: :asc) }
end
