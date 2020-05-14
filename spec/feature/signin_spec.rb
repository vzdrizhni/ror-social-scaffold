require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  before(:each) do
    @user = User.new(name: 'exampleUser',
                     email: 'example@example.com',
                     password: 'password',
                     password_confirmation: 'password')
    @user.save
  end
  scenario 'user can login' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'example@example.com'
    fill_in 'user[password]', with: 'password'

    click_button 'Log in'

    expect(page).to have_content('exampleUser')
  end
end
