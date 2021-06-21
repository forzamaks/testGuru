class FormMailer < ApplicationMailer
  def feedback(form_params)
    puts "#{form_params['title']} ccc"
    @title = form_params[:title]
    @body = form_params[:body]
    mail to: Admin.first.email || 'mak.18.sim@yandex.ru'
  end
end
