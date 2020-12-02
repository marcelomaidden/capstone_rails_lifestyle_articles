module UsersHelper
  def display_errors(user)
    messages = ''
    if user.errors.any?
      messages += "<ul class = 'form_errors'>"
      user.errors.full_messages.each do |message|
        messages += "<li>#{message}</li>"
      end
      messages += '</ul>'
    end
    messages
  end
end
