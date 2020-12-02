module UserHelper
  def display_errors(user)
    messages = ''
    if user.errors.any?
      user.errors.full_messages.each do |message|
        messages << message
      end
    end
    messages
  end
end
