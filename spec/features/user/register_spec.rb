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
end
