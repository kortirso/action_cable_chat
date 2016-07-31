class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :roommates, dependent: :destroy
    has_many :contacts, foreign_key: 'contact_id', class_name: 'Roommate'

    has_many :rooms, through: :roommates, dependent: :destroy
    
    has_many :messages, dependent: :destroy

    has_many :invitations, foreign_key: 'user_id', class_name: 'Invite', dependent: :destroy
    has_many :invites, foreign_key: 'friend_id'

    validates :username, presence: true
    validates :username, uniqueness: true, length: { in: 1..20 }

    scope :other_users, -> (user_id) { where.not(id: user_id).order(username: :asc) }

    def have_friend?(friend_id)
        self.contacts.find_by(user_id: friend_id).nil? ? false : true
    end
end
