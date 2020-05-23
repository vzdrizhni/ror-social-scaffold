require 'rails_helper'

RSpec.describe 'Comments controller', type: :feature do
  before(:each) do
    @user = User.new(name: 'huihui',
                     email: 'huihui@huihui.com',
                     password: 'caposcapos',
                     password_confirmation: 'caposcapos')
    @user.save
  end

  scenario 'user page comments' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'huihui@huihui.com'
    fill_in 'user[password]', with: 'caposcapos'

    click_button 'Log in'

    fill_in 'post[content]', with: 'post Test'

    click_button 'Save'

    expect(page).to have_content('post Test')
  end
end
