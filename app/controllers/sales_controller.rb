class SalesController < ApplicationController
  def index
  end

  def new
    @sales = Sale.new
  end

  def confirm
    @sales = Sale.new(sales_params)
    @sales.save
  end

  def create
    @sale = Sale.last
    @webpay = WebPay.new('test_secret_c6E5NG65v0t64FE0N132RbkC')
    @webpay.charge.create(currency: 'jpy', amount: @sale.price, card: params['webpay-token'])

    redirect_to root_path
  end

  def thankyou
  end

  private

  def sales_params
    params.require(:sale).permit(:name, :price, :user_id, :amount)
  end
end
