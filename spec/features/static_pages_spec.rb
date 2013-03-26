require 'spec_helper'

describe "Static pages" do

	describe "Help page" do
		it "should have the content 'Help'" do
	    	visit '/static_pages/help'
	   	 	page.should have_content('Help')
	  	end

	  	it "should have the title Help" do
			visit '/static_pages/help'
			first('head title').native.text.should == "RoR Sample App| Help"
			# page.should have_selector('title', 
				# :text => "RoR Sample App| Help")
		end
	end
  	describe "Home page" do
		it "should have the content 'Sample App'" do
	    	visit '/static_pages/home'
	   	 	page.should have_content('Sample App')
	  	end

	  	it "should have the title Home" do
			visit '/static_pages/home'
			# page.should have_selector('title', 
			# 	:text => "RoR Sample App| Home")
			first('head title').native.text.should == "RoR Sample App| Home"
		end
	end

	describe "About page" do
		it "should have the content 'About me'" do
			visit '/static_pages/about'
			page.should have_content('About me')
		end

		it "should have the title About" do
			visit '/static_pages/about'
			first('head title').native.text.should == "RoR Sample App| About"
			# page.should have_selector("title", :text => "I am")
		end
	end
end
