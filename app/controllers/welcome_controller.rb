class WelcomeController < ApplicationController

  def about
  end

  def home
    if current_user
      redirect_to :controller => 'actions', :action => 'index'
    elsif current_staff
      redirect_to :controller => 'schedules', :action => 'index'
    else
      render 'welcome/home'
    end
end
end
