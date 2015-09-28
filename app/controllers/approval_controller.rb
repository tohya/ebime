class ApprovalController < ApplicationController
  before_action :signed_in_user

  def index
    #ユーザ一覧用
    @followed_user = Relationship.where("followed_id = ?", @current_user.id)
    @user_name = []
    @followed_user.each do |u|
      @user_name << User.find(u.follower_id).name
    end
    @target_year = ["2014","2015","2016",]
    @target_month = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    
    #実績用
    if params[:user] && params[:year] && params[:month]
      user = params[:user] 
      year = params[:year]
      month = params[:month]
      date = Time.parse("#{year}/#{month}")
      @jisseki_param = [user, date]
    
      user_project = UserProject.where("user_id = ?", User.find_by_name(user).id)
      @jisseki = Jisseki.order("date").where("user_project_id IN (?) AND date BETWEEN ? AND ?", user_project.ids, date.beginning_of_month, date.end_of_month )
    end

    if params[:approval_]
      @user = user__params[:value]
    end

    if params[:remand_]
      raise "error"
    end

  end
  
  private

    def user__params
      params.require(:user_).permit(:value)
    end

    def month__params
      params.require(:month_).permit(:value)
    end

end
