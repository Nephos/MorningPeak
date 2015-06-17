module TicketsHelper

  def link_to_creator ticket
    if ticket.creator_type == "User"
      return link_to ticket.creator_name, ticket.creator.client
    else
      return ticket.creator_name
    end
  end

end
