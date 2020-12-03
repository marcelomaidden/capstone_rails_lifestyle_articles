module UserHelper
  def display_errors(user)
    
    if user.errors.any?
      user.errors.full_messages.collect do |message|
        content_tag(:div, class: 'bg-white text-info d-flex justify-content-center font-weight-bold') do 
          message
        end
      end.join.html_safe
    end    
  end
end
