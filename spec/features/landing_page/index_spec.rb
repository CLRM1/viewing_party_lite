require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'displays the application title, new user button, users and landing page link' do
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com', password: 'password123', password_confirmation: 'password123')
    user_2 = User.create!(name: 'Sally', email:'sally@gmail.com', password: 'password123', password_confirmation: 'password123')

    visit '/'
    expect(page).to have_button('Create New User')

    click_on 'Create New User'

    fill_in 'name', with: 'Chris'
    fill_in 'email', with: 'chris@gmail.com'
    fill_in 'password', with: '123'
    fill_in 'password_confirmation', with: '123'
    click_on 'Register'

    visit '/'
    within "#user-#{user_1.id}" do
      expect(page).to have_content('charlie@gmail.com')
      expect(page).to_not have_content('sally@gmail.com')
    end

    visit '/'
    within "#user-#{user_2.id}" do
      expect(page).to have_content('sally@gmail.com')
      expect(page).to_not have_content('charlie@gmail.com')
    end

    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

  it 'displays a link to the landing page' do
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com', password: 'password123', password_confirmation: 'password123')
    visit '/'
    click_link 'Log In'
    expect(current_path).to eq('/login')
    fill_in 'email', with: 'charlie@gmail.com'
    fill_in 'password', with: 'password123'
    click_on 'Log in'
    expect(current_path).to eq("/dashboard")
  end

  it "visitors do not see the exisiting users" do
    visit '/'
    expect(page).to_not have_content('Existing Users:')
  end

#   As a registered user
# When I visit the landing page
# The list of existing users is no longer a link to their show pages
# But just a list of email addresses
  it 'registered users see the existing users list' do
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com', password: 'password123', password_confirmation: 'password123')
    visit '/'
    click_on 'Create New User'

    fill_in 'name', with: 'Chris'
    fill_in 'email', with: 'chris@gmail.com'
    fill_in 'password', with: '123'
    fill_in 'password_confirmation', with: '123'
    click_on 'Register'

    visit '/'
    within "#user-#{user_1.id}" do
      expect(page).to have_content('charlie@gmail.com')
      expect(page).to_not have_link('charlie@gmail.com')
    end
  end
end
