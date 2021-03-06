class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :secure_ips, only: [:create, :destroy]

  protected

  def secure_ips
    if !%w(127.0.0.1).include?(request.remote_ip)
      render nothing: true, status: 403, layout: false
    end
  end
end
