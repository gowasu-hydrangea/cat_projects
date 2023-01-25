class Customer::SearchesController < ApplicationController
  before_action :authenticate_customer!
  
  def search
      @model=params[:model]
      @content=params[:content]
      @method=params[:method]
      if @model == 'customer'
        @records=Customer.search_for(@content,@method)
      else
        @records=CatCoffeeShop.search_for(@content,@method)
      end
  end
  
  # def search
  #   @range = params[:range]
  #   if @range == "Customer"
  #     @customers = Customer.looks(params[:search], params[:word])
  #   else
  #     @cat_coffee_shops = CatCoffeeShop.looks(params[:search], params[:word])
  #   end
  # end
  
end