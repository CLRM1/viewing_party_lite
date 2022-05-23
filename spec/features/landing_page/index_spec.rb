require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'displays the application title, new user button, users and landing page link' do
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com', password: 'password123', password_confirmation: 'password123')
    user_2 = User.create!(name: 'Sally', email:'sally@gmail.com', password: 'password123', password_confirmation: 'password123')

    visit '/'
    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_button('Create New User')

    within "#user-#{user_1.id}" do
      expect(page).to have_content('charlie@gmail.com')
      expect(page).to_not have_content('sally@gmail.com')
      click_link "charlie@gmail.com's Dashboard"
      expect(current_path).to eq("/users/#{user_1.id}")
    end

    visit '/'
    within "#user-#{user_2.id}" do
      expect(page).to have_content('sally@gmail.com')
      expect(page).to_not have_content('charlie@gmail.com')
      click_link "sally@gmail.com's Dashboard"
      expect(current_path).to eq("/users/#{user_2.id}")
    end

    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

  it 'displays a link to the landing page' do
#     As a registered user
# When I visit the landing page `/`
# I see a link for "Log In"
# When I click on "Log In"
# I'm taken to a Log In page ('/login') where I can input my unique email and password.
# When I enter my unique email and correct password
# I'm taken to my dashboard page
# 
# will check if a user exists with the email address that was provided, then check to see if the password, when hashed, matches the secure password stored in the database, and then redirects the user based on if credentials are correct.
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com', password: 'password123', password_confirmation: 'password123')
    visit '/'
    click_link 'Log In'
    expect(current_path).to eq('/login')
    fill_in 'email', with: 'charlie@gmail.com'
    fill_in 'password', with: 'password123'
    click_on 'Login'
    expect(current_path).to eq("/users/#{user_1.id}")
  end

end
