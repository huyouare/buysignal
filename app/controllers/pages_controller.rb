class PagesController < ApplicationController
  def home
  	unless user_signed_in?
  	  redirect_to :controller=>'pages', :action => 'index'
  	end
  end

  def about
  end

  def dashboard
  end

  def index
  end

end
