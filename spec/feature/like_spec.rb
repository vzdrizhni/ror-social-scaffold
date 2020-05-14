require 'rails_helper'

RSpec.describe 'Timeline like posts', type: :feature do
  before(:each) do
    @user = User.new(name: 'huihui',
                     email: 'huihui@huihui.com',
                     password: 'caposcapos',
                     password_confirmation: 'caposcapos')
    @user.save
  end

  scenario 'user can like posts' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'huihui@huihui.com'
    fill_in 'user[password]', with: 'caposcapos'

    click_button 'Log in'

    fill_in 'post[content]', with: 'post America'

    click_button 'Save'

    # After saving we click like!

    click_link 'Like!'

    expect(page).to have_content('Dislike!')

    click_link 'Dislike!'

    expect(page).to have_content('Like!')
  end
end
