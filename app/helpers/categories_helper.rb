module CategoriesHelper
  def class_visible
    return 'd-flex' if logged_in?

    'd-none'
  end

  def edit_category?(category)
    return link_to 'Edit', edit_category_path(category) unless session[:current_user].nil?

    ''
  end

  def reversed?(count)
    count < 2 ? 'flex-row' : 'flex-row-reverse'
  end
end
