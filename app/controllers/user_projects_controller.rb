class UserProjectsController < ApplicationController
  before_action :signed_in_user

  def index
    @followed_user = Relationship.where("followed_id = ?",@current_user.id)
    @user_projects = UserProject.paginate(page: params[:page])
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
      flash[:success] = "ひもづけが作成されました。"
      redirect_to @user_project
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def user_project_params
    params.require(:user_project).permit(:user_id, :project_id)
  end

end