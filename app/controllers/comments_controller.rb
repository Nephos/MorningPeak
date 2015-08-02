class CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:index, :about, :new]
  before_action :set_contact, only: [:index, :about, :new]
  before_action :set_bill, only: [:index, :about, :new]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @comments = @comments.where(commentable: @commentable) if @commentable
  end
  def about
    index()
    @comment = Comment.new
    @comment.commentable = @commentable
    render :about, layout: false
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.commentable = @commentable
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.creator = current_admin

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

  def set_client
    @commentable ||= Client.find_by_id(params[:client_id])
  end
  def set_contact
    @commentable ||= Contact.find_by_id(params[:contact_id])
  end
  def set_bill
    @commentable ||= Bill.find_by_id(params[:bill_id])
  end

end
