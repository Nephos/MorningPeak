class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_commentable, only: [:index, :about, :show, :create]
  before_action :set_commentable_client, only: [:about_client, :show, :create]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.where(commentable: @commentable) if @commentable
    @comments ||= Comment.where('0=1')
  end

  def about
    index()
    @comment = Comment.new
    @comment.commentable = @commentable
    render :about, layout: false
  end
  def about_client
    index()
    @comment = Comment.new
    @comment.commentable = @commentable
    render :about_client, layout: false
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    binding.pry
    render status: :forbidden unless admin_signed_in? or (user_signed_in? and @comment.commentable.is_a? Ticket and @comment.commentable.creator == current_user)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.commentable = @commentable
    render status: :forbidden unless admin_signed_in? or (user_signed_in? and @comment.commentable.is_a? Ticket and @comment.commentable.creator == current_user)
  end

  # GET /comments/1/edit
  def edit
    render status: :forbidden unless admin_signed_in? or (user_signed_in? and @comment.commentable.is_a? Ticket and @comment.commentable.creator == current_user)
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.creator = (current_admin || current_user)
    render status: :forbidden unless admin_signed_in? or (user_signed_in? and @comment.commentable.is_a? Ticket and @comment.commentable.creator == current_user)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    render status: :forbidden unless admin_signed_in?
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    render status: :forbidden unless admin_signed_in?
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:title, :comment, :commentable_id, :commentable_type,
                                    #:creator_id, :creator_type,
                                    :role)
  end

  def set_commentable
    return unless admin_signed_in?
    @commentable ||= Client.find_by_id(params[:client_id])
    @commentable ||= Contact.find_by_id(params[:contact_id])
    @commentable ||= Bill.find_by_id(params[:bill_id])
    @commentable ||= Ticket.find_by_id(params[:ticket_id])
    @commentable_by = 'Admin'
  end
  def set_commentable_client
    return unless user_signed_in?
    if @commentable.nil?
      @commentable ||= Ticket.find_by(id: params[:client_ticket_id], creator: current_user)
    end
  end

end
