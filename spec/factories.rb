FactoryGirl.define do 
	
	factory :user do 
		username Faker::Name
		sequence(:email) {|n| "email#{n}@random.com" }
		password_digest Faker::Lorem.words(1)
	end

	factory :post do
		title "Coco from a balcony"
		content "This is a famous cinemagraph by Jamie Beck & Kevin Burg"
		extension "gif"
		# cinemagraph { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images', 'test_image1.gif')) }
		user
	end

	factory :comment do
		title Faker::Lorem.words(2..7)  # will be erasing this when we get rid of title for comments
		body Faker::Lorem.words(15)
		user
		post
	end

	factory :vote do
		type true
		user
		post
	end

end