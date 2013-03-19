require 'spec_helper'

describe "Static pages" do

	describe "Help page" do
		it "should have the content 'Help'" do
	    	visit '/static_pages/help'
	   	 	page.should have_content('Help')
	  	end
	end
  	describe "Home page" do
		it "should have the content 'Sample App'" do
	    	visit '/static_pages/home'
	   	 	page.should have_content('Sample App')
	  	end
	end

end
