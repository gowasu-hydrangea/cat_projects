class Customer::LostCatsController < ApplicationController
  
  def new
    @lost_cat = LostCat.new
  end

  def create
    @lost_cat = LostCat.new(lost_cat_params)
    @lost_cat.customer_id = current_customer.id
    if @lost_cat.save
      redirect_to customers_lost_cats_path
    else
      render :new
    end
  end

  def index
    @lost_cats = LostCat.order(created_at: :desc).page(params[:page])
    @lost_cat = LostCat.new
  end

  def show
    @lost_cat = LostCat.find(params[:id])
  end

  def edit
    @lost_cat = LostCat.find(params[:id])
    if @lost_cat.customer_id == current_customer.id
    else
      redirect_to customer_lost_cats_path
    end
  end

  def update
    @lost_cat = LostCat.find(params[:id])
    if @lost_cat.update(lost_cat_params)
      redirect_to customer_lost_cats_path(@lost_cat.id)
      flash[:notice] = "変更が保存されました。内容をご確認ください。"
    else
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def lost_cat_params
    params.require(:lost_cat).permit(:lost_cat_title, :lost_cat_range, :lost_cat_introduction,:image)
  end
  
end
