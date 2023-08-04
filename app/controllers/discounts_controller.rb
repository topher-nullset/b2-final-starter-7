  class DiscountsController < ApplicationController
    before_action :find_discount_and_merchant, only: [:show, :destroy, :update, :edit]
    before_action :find_merchant, only: [:new, :create, :index]

  def index
    @discounts = @merchant.discounts
  end

  def show
  end

  def new
  end
  
    def create
      float = params[:percentage].to_f
      Discount.create!(percentage: float,
        threshold: params[:threshold],
        merchant: @merchant)
        redirect_to merchant_discounts_path(@merchant)
    end

  def edit
  end

  def update
    
  end

  def destroy
    @discount.destroy
    redirect_to merchant_discounts_path(@merchant)
  end

  private

  def discount_params
    params.require(:discount).permit(:percentage, :threshold, :merchant)
  end

  def find_discount_and_merchant
    @discount = Discount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end
end