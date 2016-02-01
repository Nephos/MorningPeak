class TicketsController < ApplicationController
  include CommentableForm

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_ticket_custom_route, only: [:close, :open]
  before_action :looks_ticket, only: [:show, :edit, :update, :close, :open]
  before_action :authenticate_admin!

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.order('state DESC')
  end

  def close
    respond_to do |format|
      if @ticket.close
        @ticket.update(admin_view_at: Time.now) # add comment ?
        format.html { redirect_to ticket_url(@ticket), notice: 'Ticket was successfully closed.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { redirect_to ticket_url(@ticket), alert: 'The ticket is already close' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def open
    respond_to do |format|
      if @ticket.open
        @ticket.update(creator_view_at: nil) # add comment ?
        format.html { redirect_to ticket_url(@ticket), notice: 'Ticket was successfully reopened.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { redirect_to ticket_url(@ticket), alert: 'The ticket is already open' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    prepare_comment_for @ticket
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
    @ticket.creator = current_admin

    respond_to do |format|
      if @ticket.save
        @ticket.close_head if @ticket.close?
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
    params.require(:ticket).permit(:title, :description, :state)
  end

  def looks_ticket
    @ticket.set_view_by('Admin')
  end

end
