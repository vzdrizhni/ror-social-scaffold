require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Managing friendship:', type: :feature do
  let(:user) { create(:user) }

  before(:each) do
    @friend = User.new(name: 'caposcapos',
                       email: 'caposcapos@caposcapos.com',
                       password: 'caposcapos',
                       password_confirmation: 'caposcapos')
    @friend.save

    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_button 'Log in'

    expect(page).to have_content('huihui')
    visit users_path
    expect(page).to have_content('caposcapos')
  end

  scenario 'add friend' do
    click_on 'Add friend'
    expect(page).to have_content('Friendship request sent!')
    expect(page).to have_content('Cancel Request')
  end

  scenario 'accept request' do
    click_on 'Add friend'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'user[email]', with: 'caposcapos@caposcapos.com'
    fill_in 'user[password]', with: 'caposcapos'
    click_button 'Log in'
    visit users_path
    click_on 'Accept'
    expect(page).to have_content('U are now friends')
    expect(page).to have_content('Remove friend')
  end

  scenario 'reject request' do
    click_on 'Add friend'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'user[email]', with: 'caposcapos@caposcapos.com'
    fill_in 'user[password]', with: 'caposcapos'
    click_button 'Log in'
    visit users_path
    click_on 'Reject'
    expect(page).to have_content('Friendship request rejected')
    expect(page).to have_content('Add friend')
  end

  scenario 'remove friend' do
    click_on 'Add friend'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'user[email]', with: 'caposcapos@caposcapos.com'
    fill_in 'user[password]', with: 'caposcapos'
    click_button 'Log in'
    visit users_path
    click_on 'Accept'
    expect(page).to have_content('U are now friends')
    click_on 'Remove friend'
    expect(page).to have_content('Friend removed')
  end
end
