class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	# if key called looking_for exists, use it. Otherwise, use jhu
  	@search_term = params[:search] || 'chocolate'
  	@recipes = Recipe.for(@search_term)
  end

end
