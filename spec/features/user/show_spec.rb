require 'rails_helper'

RSpec.describe "user show page" do
    it  'has a users dashboard' do
        visit '/register'

        fill_in "name",	with: "Rupert"
        fill_in "email",	with: "rupert@gmail.com"
        fill_in "password",	with: "123"
        fill_in "password_confirmation",	with: "123"
        click_button 'Register'

        expect(page).to have_content("Rupert's Dashboard")
        expect(page).to have_button("Discover Movies")
        expect(page).to have_content("Viewing Parties")
    end

end
