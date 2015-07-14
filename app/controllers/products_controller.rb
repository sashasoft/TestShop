class ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :html, :js
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product
    else
      #render 'new'
      render 'errors'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    
    
    if @product.update(product_params)
      redirect_to @product
    else
      #render 'edit'
      render 'errors'
    end
  end
  
  def delete
    @product = Product.find(params[:product_id])  
    @product.destroy
    redirect_to products_path
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  
  
private
  def product_params
    params.require(:product).permit(:name, :description)
  end
end
