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

  def brize text
    texts = text.split("\n")
    texts.join(tag(:br))
  end

  def imagize text, uris
    uris.each do |uri|
      text.gsub!(uri, "<a href='#{uri}'><img src='#{uri}' alt='#{uri}'/></a>")
    end
    text
  end

  def linkize text, uris
    uris.each do |uri|
      text.gsub!(uri, "<a href='#{uri}'>#{uri}</a>")
    end
    text
  end

  def descriptionize text
    uris = URI.extract(text)
    imgs = uris.select{|e| e.match(/\.(jpg|png|jpeg|gif)\Z/)}
    links = uris - imgs
    text = raw     text
    text = brize   text
    text = imagize text, imgs
    text = linkize text, links
    text.html_safe
  end

end
