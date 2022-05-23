require 'rails_helper'

RSpec.describe User, Type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
  end

  describe "attributes" do
    it 'should allow the creation of a new user with a password' do
      user = User.create(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end
  end
end
