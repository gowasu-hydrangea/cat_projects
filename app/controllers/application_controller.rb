class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_cat_coffee_shops_path
    when Customer
      customer_customer_path(current_customer.id)
    end
  end
  
  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end
  
  protected
  
  def configure_permitted_parameters
    if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_name,:email])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:customer_name])
    else
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
    end
  end
  
end
