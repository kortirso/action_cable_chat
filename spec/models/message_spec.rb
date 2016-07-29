RSpec.describe Message, type: :model do
    it { should belong_to :user }
    it { should belong_to :room }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :room_id }

    it 'should be valid' do
        message = create :message
        
        expect(message).to be_valid
    end
end
