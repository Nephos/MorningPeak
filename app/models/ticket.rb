# coding: utf-8
class Ticket < ActiveRecord::Base
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

  belongs_to :ticket
  has_many :tickets

  scope :heads, -> { where(ticket_id: nil) }
  scope :open, -> { heads.where(state: OPEN) }
  scope :close, -> { heads.where(state: CLOSE) }

  before_save :check_creator
  def check_creator
    return true if CREATORS.include? creator_type
    errors[:base] << "#{creator_type} is not in the list of the possible creators list"
    raise ActiveRecord::RecordInvalid.new(self)
  end

  after_create :looks_views
  def looks_views
    if creator_type == 'Admin'
      # Entre admin pas de soucis
      if head.creator_type == 'Admin'
        update(admin_view_at: Time.now, head_creator_view_at: Time.now)
      # Réponse à un client, mise a jour pour notification
      else
        update(admin_view_at: Time.now, head_creator_view_at: nil)
        head.update(admin_view_at: Time.now, head_creator_view_at: nil)
      end
    else
      # Reponse client, mise a jour pour notification
      if head?
        update(admin_view_at: nil, head_creator_view_at: Time.now)
      else
        update(admin_view_at: nil, head_creator_view_at: Time.now)
        head.update(admin_view_at: nil, head_creator_view_at: Time.now)
      end
    end
  end

  def last_response
    head.tickets.last
  end

  def head
    return self if head?
    return ticket.head
  end

  def head?
    ticket.nil?
  end

  def close
    if close?
      errors[:base] << "Already close"
      return false
    end
    head.update(state: Ticket::CLOSE) && update(state: Ticket::CLOSE)
  end

  def close_head
    if head.close?
      errors[:base] << "Already close"
      return false
    end
    head.update(state: Ticket::CLOSE)
  end

  def open
    if open?
      errors[:base] << "Already open"
      return false
    end
    head.update(state: Ticket::OPEN) && update(state: Ticket::OPEN)
  end

  def open?
    state == OPEN
  end

  def close?
    state == CLOSE
  end

  def short_description
    if description.size > 100
      description[0..97] + "..."
    else
      description
    end
  end

end
