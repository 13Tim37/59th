class PageController < ApplicationController

  def index
	render('index')
  end
  
  def login
	render('login')
  end
  
  def forums
	redirect_to("http://59th.phy.sx/")
  end
end
