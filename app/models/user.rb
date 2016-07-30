class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :roommates, dependent: :destroy
    has_many :rooms, through: :roommates
    has_many :messages, dependent: :destroy

    has_many :invitations, foreign_key: 'user_id', class_name: 'Invite', dependent: :destroy
    has_many :invites, foreign_key: 'friend_id', dependent: :destroy

    validates :username, presence: true
    validates :username, uniqueness: true, length: { in: 1..20 }

    scope :other_users, -> (user_id) { where.not(id: user_id).order(username: :asc) }
end
