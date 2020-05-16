require 'rails_helper'
require 'capybara/rails'

feature 'The signup process:' do
  scenario 'user can signup' do
    visit new_user_registration_path

    fill_in 'user[name]', with: 'huihui'
    fill_in 'user[email]', with: 'huihui@huihui.com'
    fill_in 'user[password]', with: 'caposcapos'
    fill_in 'user[password_confirmation]', with: 'caposcapos'

    click_button 'Sign up'

    expect(page).to have_content('huihui')
  end
end

feature 'The signin process:' do
  before(:each) do
    @user = User.new(name: 'huihui',
                     email: 'huihui@huihui.com',
                     password: 'caposcapos',
                     password_confirmation: 'caposcapos')
    @user.save
  end
  scenario 'user can login' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'huihui@huihui.com'
    fill_in 'user[password]', with: 'caposcapos'

    click_button 'Log in'

    expect(page).to have_content('huihui')
  end
end
