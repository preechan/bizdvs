class Users::SessionssController < Devise::SessionsController
  #before_filter :check_permissions, :only => [:new, :create, :cancel]
  #skip_before_filter :require_no_authentication
 
end