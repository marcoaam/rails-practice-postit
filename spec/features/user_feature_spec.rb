require 'rails_helper'

describe 'User system' do

	context 'Without user signed in' do

		it 'Needs to sign in when visit the welcome page' do
			visit ('/')
			expect(page).to have_content 'Sign in'
		end

	end

	context 'With a user signed up' do

		before(:each) do
			marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			login_as marco
		end

		it 'can sign in' do
			visit ('/')
			expect(current_path).to eq '/posts'
		end

	end

end