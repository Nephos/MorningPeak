module BillsHelper

  def user_bills_count_due
    return nil if not user_signed_in?
    return (current_user.bills.next + current_user.bills.retard).count
  end

end
