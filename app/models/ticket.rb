# coding: utf-8
class Ticket < ActiveRecord::Base
  acts_as_commentable

  # WARNING ! IT REVERSE LAST / FIRST
  default_scope { order('created_at DESC') }

  OPEN = 'open'
  CLOSE = 'close'

  CREATORS = ['Admin', 'User']

  validates :state, inclusion: {in: [OPEN, CLOSE]}
  # validates :creator, inclusion: {in: CREATORS}
  validates :title, length: {in: 7..124}
  validates :description, length: {minimum: 12}

  belongs_to :creator, polymorphic: true
  delegate :name, to: :creator, prefix: true

  scope :open, -> { where(state: OPEN) }
  scope :close, -> { where(state: CLOSE) }

  before_save :check_creator
  def check_creator
    return true if CREATORS.include? creator_type
    errors[:base] << "#{creator_type} is not in the list of the possible creators list"
    raise ActiveRecord::RecordInvalid.new(self)
  end

  after_create :set_view_init
  def set_view_init
    set_view_by(creator_type)
  end

  def set_view_by(viewer_type)
    if creator_type == 'Admin'
      if viewer_type == 'Admin'
        update(admin_view_at: Time.now, creator_view_at: Time.now)
      end
    elsif creator_type == 'User'
      if viewer_type == 'User'
        update(creator_view_at: Time.now)
      elsif viewer_type == 'Admin'
        update(admin_view_at: Time.now)
      end
    end
  end

  def set_unview_by(viewer_type)
    if creator_type == 'Admin'
      return # ... ?
    elsif creator_type == 'User'
      if viewer_type == 'User'
        update(admin_view_at: nil)
      elsif viewer_type == 'Admin'
        update(creator_view_at: nil)
      end
    end
  end

  def close
    if close?
      errors[:base] << "Already close"
      return false
    end
    update(state: Ticket::CLOSE)
  end

  def open
    if open?
      errors[:base] << "Already open"
      return false
    end
    update(state: Ticket::OPEN)
  end

  def open?
    state == OPEN
  end

  def close?
    state == CLOSE
  end

  def short_description
    description.to_s.first(100)
  end

end
