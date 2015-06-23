class HomeController < ApplicationController
  skip_before_action :require_login
  skip_authorization_check

  def index
  end
end
