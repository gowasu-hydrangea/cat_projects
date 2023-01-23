class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    # 会員詳細ページ
    customers_customer_path(current_customer.id)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:customer_name])
      # devise_parameter_sanitizer.permit(:account_update,keys:[:customer_name,:email])
    end
  end
  
end
