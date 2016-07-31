RSpec.describe Roommate, type: :model do
    it { should belong_to :user }
    it { should belong_to :room }
    it { should belong_to :contact }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :room_id }
    it { should validate_presence_of :contact_id }

    it 'should be valid' do
        roommate = create :roommate
        
        expect(roommate).to be_valid
    end
end
