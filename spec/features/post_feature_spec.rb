require 'rails_helper'

describe 'Posts' do

	before(:each) do
		marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		login_as marco
	end

	it 'shows nothing if no posts have been added' do
		visit ('/posts')
		expect(page).to have_content 'Nothing have been posted'
	end

	it 'shows all posts if posts have been added' do
		marco = User.first
		marco.posts.create(text: 'Great day in London today')
		visit ('/posts')
		expect(page).to have_content 'Great day in London today'
		expect(page).to have_content 'Posted by m@m.com'
	end

end