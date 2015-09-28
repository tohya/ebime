class JissekisController < ApplicationController
  before_action :signed_in_user

  def index

    if params[:method] == "post"
      project = Project.find_by_name(params[:project])
      user_project = UserProject.where("user_id = ? AND project_id = ?", @current_user.id, project.id).first
      @jisseki = Jisseki.where("user_project_id = ? AND date = ?", user_project.id, Time.parse("#{params[:month]}/#{params[:day]}")).first
      if @jisseki.blank?
        @jisseki = Jisseki.new(user_project_id: user_project.id, date: Time.parse("#{params[:month]}/#{params[:day]}"), time: params[:time])
        if @jisseki.save
          #flash[:success] = "実績が作成されました。"
        else
          #flash[:error] = "実績の作成に失敗しました。"
        end
      else
        if @jisseki.update_attributes(time: params[:time])
          #flash[:success] = "実績が更新されました。"
        else
          #flash[:error] = "実績の更新に失敗しました。"
        end
      end
    end
    
    if params[:month]
      @target_month = Time.parse("#{params[:month]}/1")      
    else
      @target_month = Time.now
    end
    @user_project = UserProject.where("user_id = ?",@current_user.id)
    @jissekis = Array.new(@user_project.size)
    @user_project.each_with_index do |u_p, i|
      @jissekis[i] = Jisseki.where("user_project_id = ? AND date BETWEEN ? AND ?", u_p.id, @target_month.beginning_of_month, @target_month.end_of_month)
    end

    #月の日数分配列を用意して0hで初期化
    @sum_by_day = Array.new(@jissekis.size).map{ Array.new(@target_month.end_of_month.day+1,0) }    
    @jissekis.each_with_index do |jisseki, project|
      jisseki.each do |j| 
        if j.time
          @sum_by_day[project][j.date.day] = j.time
          @sum_by_day[project][0] += j.time
        end
      end
    end
  end

  def show
  end

  def new
    @jisseki = Jisseki.new
  end

  def create
    Jisseki.find(1).destroy
    flash[:notice] = "Successfully Deleted"
=begin
    @jisseki = Jisseki.find(jisseki_params[:id])
    if @jisseki.update_attributes(date: jisseki_params[:date], time: jisseki_params[:time],)
      flash[:success] = "実績が更新されました。"
    else
      render 'index'
    end
=end
  end

  def create_
    @jisseki = current_user.user_projects.last.jissekis.build(jisseki_params)
    if @jisseki.save
      flash[:success] = "実績が作成されました。"
      redirect_to @jisseki
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

  private

    def jisseki_params
      params.require(:jisseki).permit(:id, :date, :time)
    end
  
end
