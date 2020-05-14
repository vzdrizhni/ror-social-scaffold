require 'rails_helper'

RSpec.describe 'Sign Up', type: :feature do
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
