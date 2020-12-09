module UserHelper
  def display_errors(user)
    return unless user.errors.any?

    user.errors.full_messages.collect do |message|
      content_tag(:div, class: 'bg-dark text-white d-flex justify-content-center font-weight-bold') do
        message
      end
    end.join.html_safe
  end

  def logged_in?
    return false if session[:current_user].nil?
    true
  end
end
