# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1b2c8252900c88c36f4086d09645c89b'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  # Will either fetch the current partner or return nil if there's no subdomain

  before_filter :check_subdomain

  def current_legislator
    return nil unless request.subdomains.size > 0
    @current_legislator ||= Legislator.find_by_short_name(request.subdomains.first)
  end

  helper_method :current_legislator

  private
  def check_subdomain
    if not current_legislator and request.subdomains.any?
      redirect_to 'http://' + BASE_URL + request.path_info
      return
    end    
  end

end
