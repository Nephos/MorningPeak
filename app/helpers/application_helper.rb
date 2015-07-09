module ApplicationHelper

  def application_title
    ['MorningPeak', ENV['COMPANY'], 'client gestion'].join(' ')
  end
end
