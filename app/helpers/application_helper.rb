module ApplicationHelper
  def login_helper(style)
    if current_user.is_a?(GuestUser)
      "<li>".html_safe + (link_to "Register", new_user_registration_path, class: style) +
      "</li>".html_safe +
      "<li>".html_safe + (link_to "Login", new_user_session_path, class: style) + "</li>".html_safe
    else
      "<li>".html_safe + (link_to "Logout", destroy_user_session_path, method: :delete, class: style) + "</li>".html_safe
    end
  end

  def source_helper
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]}", class: "source-greeting")
    end
  end

  def copyright_generator
    QweghenViewTool::Renderer.copyright("Shala Qweghen", "All rights reversed")
  end
end
