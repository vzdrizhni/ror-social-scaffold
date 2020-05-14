require 'rails_helper'

RSpec.describe 'Post controller', type: :feature do
  before(:each) do
    @user = User.new(name: 'huihui',
                     email: 'huihui@huihui.com',
                     password: 'caposcapos',
                     password_confirmation: 'caposcapos')
    @user.save
  end
  scenario 'timeline post and comments' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'huihui@huihui.com'
    fill_in 'user[password]', with: 'caposcapos'

    click_button 'Log in'

    fill_in 'post[content]', with: 'post Test'

    click_button 'Save'

    fill_in 'comment[content]', with: 'Comment Test'

    click_button 'Comment'

    expect(page).to have_content('Comment Test')
  end
end
