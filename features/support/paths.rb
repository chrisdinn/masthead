module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the homepage/i
      root_path

    when /the sign in page/i
      '/sso/login'
    when /the password reset request page/i
      new_password_path
    when /the users list page/i
      users_path
      
    when /the new user invite page/
      new_user_invite_path
    when /the redeem user invite page/
      redeem_user_invite_path(@user_invite.invite_code)
    # Add more page name => path mappings here
    
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end
 
World(NavigationHelpers)
