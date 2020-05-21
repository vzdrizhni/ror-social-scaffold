FactoryBot.define do
  factory :user, class: 'User' do
    name { 'huihui' }
    email { 'huihui@huihui.com' }
    password { 'caposcapos' }
    password_confirmation { 'caposcapos' }
  end
end