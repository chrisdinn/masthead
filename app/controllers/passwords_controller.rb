class PasswordsController < Clearance::PasswordsController
  skip_before_filter :go_sign_in
  
  def success
    render :action => 'success', :layout => 'application'
  end
  
  private
  
  def url_after_create
    success_passwords_url
  end

end