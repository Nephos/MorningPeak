module TicketsHelper

  def link_to_creator ticket
    if ticket.creator_type == "User"
      return link_to ticket.creator_name, ticket.creator.client
    else
      return ticket.creator_name
    end
  end

  def admin_tickets_unview_count
    return if not admin_signed_in?
    return current_admin.tickets_unview.count
  end

  def html_with_br(text)
    texts = text.split("\n").map{|e| raw(e)}
    texts.join(tag(:br)).html_safe
  end

end
