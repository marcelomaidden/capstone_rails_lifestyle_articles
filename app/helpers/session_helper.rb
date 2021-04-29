module SessionHelper
  def show_links
    if session[:current_user].nil?
      return "<li class = 'session-menu text-nowrap ul-session'>
        #{link_to 'SIGN-IN', login_path}
      </li>
      <li class = 'session-menu'>
        <span class = 'px-1 d-none d-lg-flex pt-1'>|</span>
      </li>
      <li class = 'session-menu'>
        #{link_to 'REGISTER', new_user_path}
      </li>".html_safe
    end
    "<li class = 'session-menu ul-session '>
      #{ link_to session[:current_user]['name'], user_path(session[:current_user]['id']) }
    </li>
    <li class = 'session-menu text-nowrap'>
      #{link_to  'LOG-OUT', logout_path}
    </li>".html_safe
  end
end
