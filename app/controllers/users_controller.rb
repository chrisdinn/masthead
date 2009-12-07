class UsersController < Clearance::UsersController
  
  def index
    @users = ::User.all
    @user_invites = ::UserInvite.all
  end
  
  def create
      @user = User.new params[:user]
      @user.invite_code = params[:invite_code]
      if @user.save
        flash[:notice] = "You will receive an email within the next few minutes. " <<
                           "It contains instructions for confirming your account."
        redirect_to url_after_create
      else
        render :action => "new"
      end
  end

end