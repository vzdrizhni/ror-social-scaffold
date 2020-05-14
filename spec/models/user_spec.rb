require 'rails_helper'

RSpec.describe 'User model', type: :model do
  before :each do
    User.create(name: 'huihui', email: 'huihui@huihui.com', password: "caposcapos", password_confirmation: "caposcapos")
  end

  describe '#name' do
    it 'doesnt take user without the name' do
      user = User.new
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")

      user.name = 'huihui'
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blank")
    end
  end

  describe '#email' do
    it 'validates for presence of email adress' do
      user = User.new
      user.name = 'huihui3334'
      user.email = ''
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")

      user.email = 'huihui3334@gmail.com'
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end

    it 'validates for format of email adress' do
      user = User.new
      user.name = 'huihui9999'
      user.email = 'huihuihuihui..com'
      user.valid?
      expect(user.errors[:email]).to include('is invalid')

      user.email = 'huihui9999@gmail.com'
      user.valid?
      expect(user.errors[:email]).to_not include('is invalid')
    end

  it 'validates email uniquness' do
      user = User.new
      user.name = 'huihui'
      user.email = 'huihui@huihui.com'
      user.password = 'foobar'
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')

      user.name = 'huihui33'
      user.email = 'huihuigen@huihui.com'
      user.password = '123456'
      expect(user.valid?).to eql(true)
    end
  end

  describe '#password' do
    it 'validates the presence of password' do
      user = User.new
      user.name = 'huihui12'
      user.email = 'huihui12@huihui.com'
      user.password = ''
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")

      user.password = '123456'
      expect(user.valid?).to eql(true)
    end

    it 'validates the password confirmation' do
      user = User.new
      user.name = 'huihui13'
      user.email = 'huihui13@huihui.com'
      user.password = '1234567'
      user.password_confirmation = '123456'
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")

      user.password = '123456'
      expect(user.valid?).to eql(true)
    end

    it 'validates the password length' do
      user = User.new
      user.name = 'huihui12'
      user.email = 'huihui12@huihui.com'
      user.password = ''
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")

      user.password = '123456'
      expect(user.valid?).to eql(true)
    end
  end
end
