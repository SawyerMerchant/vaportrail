module CookieHelper

  def add_cookie(cookie_name, value)
    response.set_cookie(cookie_name, value)
  end
end
