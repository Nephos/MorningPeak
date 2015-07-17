module ApplicationHelper

  def application_title
    ['MorningPeak', ENV['COMPANY'], 'CRM'].compact.join(' ')
  end
end
