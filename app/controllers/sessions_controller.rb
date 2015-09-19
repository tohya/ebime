class SessionsController < ApplicationController

  def new
    if signed_in?
      redirect_back_or jisseki_path
    end
  end

  def create    
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if params[:kintai_button]
        redirect_to kintai_path
      elsif params[:jisseki_button]
        redirect_to jisseki_path        
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
