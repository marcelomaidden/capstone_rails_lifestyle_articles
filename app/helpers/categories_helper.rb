module CategoriesHelper
  def class_visible
    return "d-flex" if logged_in?
    "d-none"
  end
end