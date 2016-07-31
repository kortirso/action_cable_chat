RSpec.describe Room, type: :model do
    it { should have_many :roommates }
    it { should have_many(:users).through(:roommates) }
    it { should have_many :messages }

    it 'should be valid' do
        room = create :room
        
        expect(room).to be_valid
    end

    describe 'Room' do
        let!(:user_1) { create :user }
        let!(:user_2) { create :user }

        context '.with_user' do
            let!(:room) { create :room }
            let!(:roommate) { create :roommate, user: user_1, contact: user_2, room: room }
            let!(:roommate) { create :roommate, user: user_2, contact: user_1, room: room }

            it 'should return username of another user in the room' do
                expect(room.with_user(user_1.id)).to eq user_2
            end
        end

        context '.build' do
            it 'should creates new Room' do
                expect { Room.build(user_1.id, user_2.id) }.to change(Room, :count).by(1)
            end

            it 'and should creates 2 new Roommates' do
                expect { Room.build(user_1.id, user_2.id) }.to change(Roommate, :count).by(2)
            end

            it 'and should not create new Room if room already exist' do
                Room.build(user_1.id, user_2.id)

                expect { Room.build(user_1.id, user_2.id) }.to_not change(Room, :count)
            end
        end
    end
end
