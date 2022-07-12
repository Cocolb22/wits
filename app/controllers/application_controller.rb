class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :disable_nav?

  include Pundit::Authorization

  after_action :verify_authorized, except: %i[home index search], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def disable_nav?
    @disable_nav = devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || search_spots_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
