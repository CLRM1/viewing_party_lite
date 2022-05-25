require 'rails_helper'

RSpec.describe "user show page" do

  before(:each) do
    visit '/register'

    fill_in "name",	with: "Rupert"
    fill_in "email",	with: "rupert@gmail.com"
    fill_in "password",	with: "123"
    fill_in "password_confirmation",	with: "123"
    click_button 'Register'
  end

  it  'has a users dashboard' do
    expect(page).to have_content("Rupert's Dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end

  it 'allows a user to log out' do
    visit '/'
    expect(page).to_not have_link('Log In')
    expect(page).to_not have_button('Create New User')
    click_link 'Log Out'
    expect(current_path).to eq('/')
    expect(page).to have_link('Log In')
    expect(page).to have_button('Create New User')
  end

end
