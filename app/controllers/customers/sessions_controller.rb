# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def new_guest
    customer = Customer.guest
    # ユーザーをログインさせる
    sign_in customer
    redirect_to customer_cat_coffee_shops_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  
  # def after_sign_in_path_for(resource)
  #   customer_customer_path(current_customer.id)
  # end
  
  # def after_sign_out_path_for(resource)
  #   root_path
  # end
  
  # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # devise_parameter_sanitizer.permit(:sign_in,keys:[:customer_name])
      # devise_parameter_sanitizer.permit(:account_update,keys:[:customer_name,:email])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:customer_name])
  # end
  
end
