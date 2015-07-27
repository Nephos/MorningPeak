module CommentableForm

  def prepare_comment_for(commentable)
    @comment = Comment.new
    @comment.commentable = commentable
  end

end
