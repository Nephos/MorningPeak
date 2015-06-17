class Ticket < ActiveRecord::Base

  OPEN = :open
  CLOSE = :close

  belongs_to :client
  belongs_to :bill
  belongs_to :ticket
  has_many :tickets

  delegate :name, to: :client, prefix: true
  delegate :title, to: :bill, prefix: true, allow_nil: true

  scope :heads, -> { where(ticket_id: nil) }
  scope :open, -> { heads.where(state: OPEN) }
  scope :close, -> { heads.where(state: CLOSE) }

  def head
    return self if not ticket
    return ticket.head
  end

  def is_open?
    state == OPEN
  end

  def is_close?
    state == CLOSE
  end

end
