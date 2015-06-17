class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_ticket_custom_route, only: [:close, :open, :respond]
  before_action :authenticate_admin!

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.heads.order('state DESC')
  end

  def close
    respond_to do |format|
      if @ticket.close
        format.html { redirect_to tickets_url, notice: 'Ticket was successfully closed.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :index }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def open
    respond_to do |format|
      if @ticket.open
        format.html { redirect_to tickets_url, notice: 'Ticket was successfully reopened.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :index }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def respond
    @ticket_id = @ticket.head.id
    @ticket = Ticket.new(ticket_id: @ticket.head.id)
    render :new
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def set_ticket_custom_route
      @ticket = Ticket.find(params[:ticket_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:client_id, :bill_id, :title, :description, :state)
    end
end
