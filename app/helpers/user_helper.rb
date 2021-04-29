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

  def edit_user?(user)
    if !session[:current_user].nil? && session[:current_user]['id'] == user.id
      return link_to 'Edit', edit_user_path(user).html_safe
    end

    flash[:notice] = 'User not allowed edit'
  end
end
