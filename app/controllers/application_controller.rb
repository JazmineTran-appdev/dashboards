class ApplicationController < ActionController::Base
  def homepage

    render({ :template => "home_template/homepage.html.erb" })
  end
end
