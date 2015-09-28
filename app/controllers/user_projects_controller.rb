class UserProjectsController < ApplicationController
  before_action :signed_in_user

  def index
    #ユーザ一覧用
    @followed_user = Relationship.where("followed_id = ?", @current_user.id)
    #プロジェクト割り当て削除用
    if params[:user]
      @user = User.find_by_name(params[:user])
      @user_projects = UserProject.where("user_id = ?", @user.id)
      @assign_projects = Array.new
      assign_project_ids = Array.new
      @user_projects.each do |u_p|
        @assign_projects << Project.find(u_p.project_id)
        assign_project_ids << Project.find(u_p.project_id).id
      end
      if assign_project_ids.empty?
        @yet_projects = Project.all
      else
        @yet_projects = Project.where("id NOT IN (?)", assign_project_ids)
      end
    end
    #プロジェクト割り当て用
    @user_project = UserProject.new
  end

  def show
    @user_project = UserProject.find(params[:id])
  end

  def new
    @user_project = UserProject.new
  end

  def create
    @user_project = UserProject.new(user_project_params)
    if @user_project.save
      flash[:success] = "プロジェクトが割り当てられました。"
    else
      flash[:success] = "プロジェクトの割り当てに失敗しました。"
    end
      redirect_to assign_path
  end

  def edit
  end

  def update
    @user_project = UserProject.find(params[:id])
    if params[:delete_button]
      @user_project.destroy
      flash[:success] = "プロジェクトの割り当てが解除されました。"
       redirect_to assign_path
    end
  end

  def destroy
  end

  def user_project_params
    params.require(:user_project).permit(:id, :user_id, :project_id)
  end

end