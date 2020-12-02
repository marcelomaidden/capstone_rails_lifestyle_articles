module UserHelper
  def display_errors(user)
    
    if user.errors.any?
      user.errors.full_messages.each do |message|
        message
      end
    end
  end
end
