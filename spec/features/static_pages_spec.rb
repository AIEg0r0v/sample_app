require 'spec_helper'

describe "Static pages" do
	subject { page }
	
	describe "Help page" do
		before {visit help_path}
		it {should have_content('Help')}
	  	
	  	it {first('head title').native.text.should == full_title("Help")}
	end

  	describe "Home page" do
  		before {visit root_path}
		it {should have_content('Sample App')}

	  	it {first('head title').native.text.should == full_title('')}

		it {should have_selector('p',text:'this')}
	end

	describe "About page" do
		before {visit about_path}
		it {should have_content('About me')}

		it {first('head title').native.text.should == full_title("About")}
	end

	describe "Contacts page" do
		before {visit contacts_path}
		
		it {should have_content('My contacts')}

		it {first('head title').native.text.should == full_title("Contacts")}
	end
end
