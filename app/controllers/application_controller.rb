class ApplicationController < ActionController::Base
  # need a signed up user who is also signed in
  before_action :authenticate_user!

end
