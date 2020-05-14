require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
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
