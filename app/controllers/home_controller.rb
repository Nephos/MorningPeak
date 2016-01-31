class HomeController < ApplicationController
  before_action :authenticate_admin!, only: [:admin_dashboard, :export]
  before_action :authenticate_user!, only: [:user_dashboard]

  def user_dashboard
    @retard_bills = current_user.bills.retard.count
    @advanced_bills = current_user.bills.advanced.count
    @next_bills = current_user.bills.next.count
    @old_bills = current_user.bills.old.count
    @bills_count = current_user.bills.count
    @ticket_closed = current_user.tickets.close.count
    @ticket_opened = current_user.tickets.open.count
    @ticket_waiting = current_user.tickets_unview.count
  end

  def admin_dashboard
    @clients_count = Client.count
    @contacts_count = Contact.count
    @no_client_contacts_count = (Client.all.pluck(:id) - Contact.all.pluck(:client_id).uniq).size
    @retard_bills = Bill.retard.count
    @advanced_bills = Bill.advanced.count
    @next_bills = Bill.next.count
    @old_bills = Bill.old.count
    @bills_count = Bill.count
    @ticket_closed = Ticket.close.count
    @ticket_opened = Ticket.open.count
    @ticket_waiting = current_admin.tickets_unview.count
  end

  def export
    redirect_to "/admins/export.json" if params[:format] != "json"
    @clients = Client.all
    @contacts = Contact.all
    @bills = Bill.all
  end

end
