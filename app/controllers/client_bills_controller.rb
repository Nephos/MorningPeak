class ClientBillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @bills = current_user.bills.all.order('paid ASC, due_date ASC')
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
      @bill = nil if current_user.client != @bill.client
    end

end
