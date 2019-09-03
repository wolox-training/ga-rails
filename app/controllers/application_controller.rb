class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
end
