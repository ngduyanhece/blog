module ApplicationHelper
	def sidebar
		str = ''
		str += '<aside class="sidebar">'
    str += '<div id="logged_in">'
    if user_signed_in?
      str += "<p id=""user_info"">#{current_user}<br>#{link_to('Logout', destroy_user_session_path, :method => :delete)}</p>"
    else
      str += "<p id=""user_info"">#{link_to('Login', new_user_session_path)} | #{link_to('Register', new_user_registration_path)}</p>"
    end
		str += '<div id="new_post">'
		str += "<p>#{link_to('New Post', new_post_path)}</p>"
		str += '</div>'
		str += '</aside>'
		raw(str)
	end
end
