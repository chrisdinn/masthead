class UserInvitesController < ApplicationController

  # GET /user_invites/new
  # GET /user_invites/new.xml
  def new
    @user_invite = UserInvite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_invite }
    end
  end

  # POST /user_invites
  # POST /user_invites.xml
  def create
    @user_invite = UserInvite.new(params[:user_invite])

    respond_to do |format|
      if @user_invite.save
        flash[:notice] = 'UserInvite was successfully created.'
        format.html { redirect_to(users_path) }
        format.xml  { render :xml => @user_invite, :status => :created, :location => @user_invite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_invite.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
