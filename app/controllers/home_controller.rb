class HomeController < ApplicationController

  def index
  end

  def user_dashboard
    if not user_signed_in?
      redirect_to root_url
    end
  end

  def admin_dashboard
    if not admin_signed_in?
      redirect_to root_url
    end
    @clients_count = Client.count
    @contacts_count = Contact.count
    @no_client_contacts_count = (Client.all.pluck(:id) - Contact.all.pluck(:client_id).uniq).size
    @retard_bills = Bill.retard.count
    @advanced_bills = Bill.advanced.count
    @next_bills = Bill.next.count
    @old_bills = Bill.old.count
    @bills_count = Bill.count
    @ticket_closed = Ticket.heads.close.count
    @ticket_opened = Ticket.heads.open.count
  end

end
