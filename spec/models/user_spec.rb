require 'rails_helper'

RSpec.describe User, type: :model do
	#before each test: 
	before(:each) do
		@user = User.create!(name: "test name", email: "email@yahoo.com", password: "password")
	end

	describe "creation" do
		it "should have one item created after being created" do
			expect(User.all.count).to eq(1)
		end
	end

	describe "validations" do
		it "should not let a user be created without email" do
			@user.email = nil
			expect(@user).to_not be_valid
		end

		it "should not let a user be created without password" do
			@user.password = nil
			expect(@user).to_not be_valid
		end
	end

	describe "length validations" do
		it "should not let a user be created if length exceeds 51 characters" do 
			@user.name = "Super super long name because I need to break this test somehow am I there yet"
			expect(@user).to_not be_valid
		end
	end

end

