module CategoriesHelper
  def class_visible
    return 'd-flex' if logged_in?

    'd-none'
  end

  def edit_category?(category)
    unless session[:current_user].nil?
      return link_to 'Edit', edit_category_path(category)
    end

    ''
  end

  def reversed?(count)
    count < 2 ? 'flex-row' : 'flex-row-reverse'
  end
end
