class WelcomeController < ApplicationController

	before_action :authenticate_user!

  def index
  	redirect_to('/posts') if user_signed_in?
  end

end
