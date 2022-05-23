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
#     As a visitor
# When I visit `/register`
# and I fail to fill in my name, unique email, OR matching passwords,
# I'm taken back to the `/register` page
# and a flash message pops up, telling me what went wrong
    it 'displays an error message when not all required fields have been filled in' do
      visit '/register'

      fill_in 'name', with: 'Chris'
      fill_in 'email', with: 'chris@gmail.com'
      fill_in 'password', with: '123'
      click_button 'Register'
      expect(current_path).to eq('/register')
      expect(page).to have_content('Error, Fill in all fields')
    end
  end
end
