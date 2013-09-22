FactoryGirl.define do

	factory :user do
		username Faker::Internet.user_name
		sequence(:email) {|n| "email#{n}@random.com" }
		password Faker::Lorem.words(1)
	end

	factory :post do
		title "Coco from a balcony"
		content "This is a famous cinemagraph by Jamie Beck & Kevin Burg"
		extension "gif"
		# cinemagraph { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images', 'test_image1.gif')) }
		user
	end

	factory :comment do
		content "Wow, it captures the moment"
		user
		post
	end

	factory :vote do
		votable_type "post" 
		votable_id 1
		type true
	end

end
