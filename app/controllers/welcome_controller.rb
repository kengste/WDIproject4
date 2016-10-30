class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def about
  end

  def home
  end
end
