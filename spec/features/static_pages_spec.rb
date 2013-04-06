require 'spec_helper'

describe "Static pages" do
	subject { page }
	

	shared_examples_for "all static pages" do
		it {should have_selector('h1',	text: heading)}
	  	it {first('head title').native.text.should == full_title(page_title)}
	end
	describe "Help page" do
		before {visit help_path}

		let(:heading) {'Help is here'}
		let(:page_title) {'Help'}

		it_should_behave_like "all static pages"
	end

  	describe "Home page" do
  		before {visit root_path}
		
		let(:heading) {'Sample App'}
		let(:page_title) {''}
				
		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before {visit about_path}

		let(:heading) {'About me'}
		let(:page_title) {'About'}

		it_should_behave_like "all static pages"
		
	end

	describe "Contacts page" do
		before {visit contacts_path}

		let(:heading) {'My contacts'}
		let(:page_title) {'Contacts'}

		it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector('h1', text: 'About me')
		click_link "Help"
		page.should have_selector('h1', text: 'Help is here')
		click_link "Home"
		page.should have_selector('h1', text: 'Sample App')
		click_link "Sign up"
		page.should have_selector('h1', text: 'Sign up')
		click_link "sample app"
		page.should have_selector('h1', text: 'Sample App')
		click_link "Contacts"
		page.should have_selector('h1', text: 'My contacts')
	end
end
