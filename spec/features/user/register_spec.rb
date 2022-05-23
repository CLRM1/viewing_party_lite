require 'rails_helper'

RSpec.describe "register page" do

  describe 'happy path' do
    it 'has a page to register' do
      visit '/register'

      fill_in "name",	with: "Rupert"
      fill_in "email",	with: "rupert@gmail.com"
      fill_in "password",	with: "123"
      fill_in "password_confirmation",	with: "123"
      click_button 'Register'

      rup = User.first
      expect(current_path).to eq("/users/#{rup.id}")
      expect(page).to have_content("Rupert's Dashboard")
    end
  end

  describe 'sad path' do
    it 'displays an error message when not all required fields have been filled in' do
      visit '/register'

      fill_in 'name', with: 'Chris'
      fill_in 'email', with: 'chris@gmail.com'
      click_button 'Register'
      expect(current_path).to eq('/register')
      expect(page).to have_content("Password can't be blank")
    end

    it "displays an error when password and password_confirmation don't match" do
      visit '/register'

      fill_in "name",	with: "Rupert"
      fill_in "email",	with: "rupert@gmail.com"
      fill_in "password",	with: "123"
      fill_in "password_confirmation",	with: "456"
      click_button 'Register'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Password confirmation doesn't match ")
    end
  end
end
