class ApplicationController < ActionController::Base
  include Wor::Paginate
  before_action :authenticate_user!, unless: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
end
