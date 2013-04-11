FactoryGirl.define  do
	factory :user do
		name "Alex the Terrible"
		email "email@mailbox.com"
		password "foobar"
		password_confirmation "foobar"
	end
end