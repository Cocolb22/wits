class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :disable_nav?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def disable_nav?
    @disable_nav = devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || search_spots_path

  end
end
