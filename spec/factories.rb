# Factories define minimum valid objects
FactoryGirl.define do
  factory :user do
    username 'admin'
    password 'password'
    password_confirmation 'password'
  end

  factory :subject do
    # Calculate random UID
    uid { "#{rand(36**32).to_s(36)}" }
  end

  factory :image do
  end

  factory :video do
  end

  factory :collection do
  end

  factory :application do
  end

  factory :text do
  end

  factory :audio do
  end
end
