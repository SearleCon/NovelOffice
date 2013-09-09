require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  respond_to :html, :json, :js

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Do not render layout if ajax request is made
  layout :has_layout?

  private
  def has_layout?
    false if request.xhr?
  end

  def after_sign_out_path_for(resource)
    new_feedback_url
  end

  def after_sign_in_path_for(user)
    stories_url(user)
  end

  protected
  # Allow non devise generated model fields to be permitted by strong parameters for devise
  # See lib/user_sanitizer.rb for more info
  def devise_parameter_sanitizer
    UserSanitizer.new(User, :user, params)
  end

end
