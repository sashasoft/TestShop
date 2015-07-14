class ProductsController < ApplicationController
  respond_to :html, :js
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to @product
    else
      render 'errors'
    end
    
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
   
    if @product.update(product_params)
      redirect_to @product
    else
      render 'update'
    end
  end
  
  def delete
    @product = Product.find(params[:product_id])
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  
  def errors
    @product
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :description)
    end
end
