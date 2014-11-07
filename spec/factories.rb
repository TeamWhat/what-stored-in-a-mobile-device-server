FactoryGirl.define do
  factory :user do
    name 'Admin'
    password 'password'
    password_confirmation 'password'
  end

  factory :subject do
    uid { "#{rand(36**32).to_s(36)}" }
  end

  factory :image do
  end

  factory :image_collection do
  end
end
