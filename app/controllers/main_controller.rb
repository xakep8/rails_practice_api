class MainController < ApplicationController
  def index
    render json: { message: 'Welcome to the Main Controller!' }
  end

  def show
    render json: { message: 'This is the show action in Main Controller.' }
  end

  private

  def authenticate_user!
    # Logic for user authentication can be added here
  end
end