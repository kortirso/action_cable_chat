RSpec.describe Invite, type: :model do
    it { should belong_to :user }
    it { should belong_to :friend }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :friend_id }

    it 'should be valid' do
        invite = create :invite
        
        expect(invite).to be_valid
    end
end
