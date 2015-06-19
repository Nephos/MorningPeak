module TicketClientsHelper

  def user_tickets_unview_count
    return nil if not user_signed_in?
    return current_user.tickets_unview.count
  end

end
