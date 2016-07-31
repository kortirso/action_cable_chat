RSpec.describe User, type: :model do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should have_many :roommates }
    it { should have_many :contacts }
    it { should have_many(:rooms).through(:roommates) }
    it { should have_many :messages }
    it { should have_many :invitations }
    it { should have_many :invites }

    describe 'User' do
        let(:user) { create :user }

        it 'should be valid' do
            expect(user).to be_valid
        end

        it 'should be invalid when sign up with existed username' do
            expect { create :user, username: user.username }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it 'should be invalid when sign up with existed email' do
            expect { create :user, email: user.email }.to raise_error(ActiveRecord::RecordInvalid)
        end
    end
end
