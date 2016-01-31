class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at DESC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a creator
  belongs_to :creator, polymorphic: true

  def thread(commentable=:self)
    commentable = self.commentable if commentable == :self
    if commentable.nil?
      []
    else
      Comment.where(commentable: commentable)
    end
  end

  after_create :update_view_date_for_ticket
  def update_view_date_for_ticket
    if commentable.is_a? Ticket
      commentable.updated_by(creator.class.to_s)
    end
  end

end
