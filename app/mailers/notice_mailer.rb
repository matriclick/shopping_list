# coding: utf-8
class NoticeMailer < ActionMailer::Base
	default from: "hhanckes@gmail.com"

	#CONTACT
  def shopping_list_email(menu)
    @menu = menu
  	mail to: "hans@matriclick.com", subject: "Lista de Compras"
  end
  
end