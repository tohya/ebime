class ProjectsController < ApplicationController
  before_action :signed_in_user

  def index
    #一覧用
    @projects = Project.all
    #詳細・更新用
    @project = Project.find_by_name(params[:project]) if params[:project]
    #新規作成用
    @new_project = Project.new
  end

  def show
    #@project = Project.find(params[:id])
  end

  def new
    #@project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "プロジェクトが作成されました。"
    else
      flash[:success] = "プロジェクトの作成に失敗しました。"
    end
    redirect_to :action => "index"
  end

  def edit
  end

  def update
    @project = Project.find(project_params[:id])
    if params[:update_button]
      if @project.update_attributes(project_params)
        flash[:success] = "プロジェクト情報が更新されました。"
        redirect_to @project
      else
        render 'index'
      end
    elsif params[:delete_button]
      @project.destroy
      flash[:success] = "プロジェクトが削除されました。"
      redirect_to project_path
    end
  end

  def destroy
    Project.find_by_name(project_params[:name]).destroy
    flash[:success] = "Project destroyed."
    redirect_to project_path
  end

  private

  def project_params
    params.require(:project).permit(:id, :name)
  end

end
