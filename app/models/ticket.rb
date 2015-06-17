class Ticket < ActiveRecord::Base

  OPEN = 'open'
  CLOSE = 'close'

  CREATORS = ['Admin', 'User']

  belongs_to :creator, polymorphic: true
  before_save :check_creator
  def check_creator
    return true if CREATORS.include? creator_type
    errors.add "#{creator_type} is not in the list of the possible creators list"
    raise ActiveRecord::RecordInvalid.new(self)
  end

  belongs_to :bill
  belongs_to :ticket
  has_many :tickets

  delegate :name, to: :creator, prefix: true

  scope :heads, -> { where(ticket_id: nil) }
  scope :open, -> { heads.where(state: OPEN) }
  scope :close, -> { heads.where(state: CLOSE) }

  def last_response
    head.tickets.last
  end

  def head
    return self if not ticket
    return ticket.head
  end

  def close
    if close?
      errors.add "Already close"
      return false
    end
    head.update(state: Ticket::CLOSE) && update(state: Ticket::CLOSE)
  end

  def close_head
    if head.close?
      errors.add "Already close"
      return false
    end
    head.update(state: Ticket::CLOSE)
  end

  def open
    if open?
      errors.add "Already open"
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

end
