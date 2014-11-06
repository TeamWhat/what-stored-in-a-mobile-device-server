FactoryGirl.define do
	factory :user do
		name 'Admin'
		password 'password'
		password_confirmation 'password'
	end

	factory :subject do
		uid {"#{rand(36**32).to_s(36)}"}
	end
end