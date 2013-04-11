require 'spec_helper'

describe "UserPages" do

	subject{ page }
	
  	describe "signup page" do
  		before { visit signup_path }

    	it { should have_selector('h1'	, text: 'Sign up') }
      	it { first('head title').native.text.should == full_title("Sign up") }
  	end

  	describe "profile page" do
  		#code to make user variable, like
  		let(:user) { FactoryGirl.create(:user) }
  		before { visit user_path(user) }

  		it { should have_selector('h1', 	text: user.name) }
  		it { first('head title').native.text.should == full_title(user.name) }
  	end

  	describe "signup" do
  		before {visit signup_path}
  		let(:submit) { "Create my account" }

		describe "with" do

			describe "blank submission" do
				before { click_button submit}

				it { should have_content('Password digest can\'t be blank') }
				it { should have_content('Name can\'t be blank') }
				it { should have_content('Email can\'t be blank') }
				it { should have_content('Email is invalid') }
				it { should have_content('Password can\'t be blank') }
				it { should have_content('Password is too short (minimum is 6 characters)') }
				it { should have_content('Password confirmation can\'t be blank') }
			end
			describe "with invalid email" do
				before do 
					fill_in "Name", 		with: "Example User"
					fill_in "Email", 		with: "invalid@email_example"
					fill_in "Password", 	with: "foobar"
					fill_in "Confirmation", with: "foobar"
					click_button submit
				end

				it { should have_content('Email is invalid') }
			end

			describe "with invalid password confirmation" do
				before do 
					fill_in "Name", 		with: "Example User"
					fill_in "Email", 		with: "valid@example.com"
					fill_in "Password", 	with: "foobar"
					fill_in "Confirmation", with: "foobaz"
					click_button submit
				end
				
				it { should have_content('Password doesn\'t match confirmation') }
			end

			describe "with too short password" do
				before do 
					fill_in "Name", 		with: "Example User"
					fill_in "Email", 		with: "valid@example.com"
					fill_in "Password", 	with: "foo"
					fill_in "Confirmation", with: "foo"
					click_button submit
				end
				 
				it { should have_content('Password is too short (minimum is 6 characters)') }
			end
			describe "with email that has already been taken" do
				before do 
					User.create(name: "TestUser", email:"test@example.com",
						password: "foobar", password_confirmation:"foobar")
					fill_in "Name", 		with: "Example User"
					fill_in "Email", 		with: "test@example.com"
					fill_in "Password", 	with: "foobar"
					fill_in "Confirmation", with: "foobar"
					click_button submit
				end
				
				it { should have_content(' Email has already been taken')  } 
			end

			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do 
				fill_in "Name", 		with: "Example User"
				fill_in "Email", 		with: "user@example.com"
				fill_in "Password", 	with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) {User.find_by_email('user@example.com')}

		      	it { first('head title').native.text.should == full_title(user.name) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome aboard') }
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end

