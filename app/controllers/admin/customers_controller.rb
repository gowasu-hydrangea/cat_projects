class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @cat_coffee_shops = @customer.cat_coffee_shops.page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
      flash[:notice] = "変更が保存されました。内容をご確認ください"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :customer_name, :is_deleted)
  end
  
end
