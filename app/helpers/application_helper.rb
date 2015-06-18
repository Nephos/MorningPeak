module ApplicationHelper

  def application_title
    ['Appli', ENV['COMPANY'], 'client gestion'].join(' ')
  end
end
