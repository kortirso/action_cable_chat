RSpec.describe Room, type: :model do
    it { should have_many :roommates }
    it { should have_many(:users).through(:roommates) }
    it { should have_many :messages }

    it 'should be valid' do
        room = create :room
        
        expect(room).to be_valid
    end

    describe 'Room' do
        context '.with_user' do
            let!(:user_1) { create :user }
            let!(:user_2) { create :user }
            let!(:room) { create :room }
            let!(:roommate) { create :roommate, user: user_1, room: room }
            let!(:roommate) { create :roommate, user: user_2, room: room }

            it 'should return username of another user in the room' do
                expect(room.with_user(user_1.id)).to eq user_2
            end
        end
    end
end
