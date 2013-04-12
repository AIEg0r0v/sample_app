require 'spec_helper'

describe "Authentication" do
  
	subject { page }

	describe "signin" do
	    before { visit signin_path }
		
		it { should have_selector('h1', text: 'Sign in') }
    	# do something with title check. The one I have right now 
    	# is not convinient at all

		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_selector('div.alert.alert-error', text: 'Invalid') }

			describe "after visiting another page" do
				before { click_link "Home" } 
				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", 	with: user.email
				fill_in "Password",	with: user.password
				click_button "Sign in"
			end

			    	
			it { should have_selector('h1'	, text: user.name) }
			it { should have_link('Profile') }
			it { should have_link('Sign out') }
			it { should_not have_link('Sign in') }

			describe "followed by signout" do
				before {click_link "Sign out"}
				it {should have_link('Sign in')}
			end
		end

    end
end