require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @requester = User.create(name: 'test1', email: 'test1@test.com',
                      password: '123456')
    @requestee = User.create(name: 'test2', email: 'test2@test.com',
                        password: '123456')
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  describe 'validations' do
    subject { Friendship.create(user_id: @requester.id, friend_id: @requestee.id, confirmed: false) }
    it { should validate_presence_of(:friend_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_uniqueness_of(:user).scoped_to(:friend_id).ignoring_case_sensitivity }
  end
end
