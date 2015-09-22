class JissekisController < ApplicationController
  before_action :signed_in_user

  def index
    @target_month = Time.now
    @user_project = UserProject.where("user_id = ?",@current_user.id)
    @jissekis = Array.new(@user_project.size)
    @user_project.each_with_index do |u_p, i|
      @jissekis[i] = Jisseki.where("user_project_id = ?",u_p.id)
    end

    #月の日数分配列を用意して0hで初期化
    @sum_by_day = Array.new(@jissekis.size).map{ Array.new(@target_month.end_of_month.day+1,0) }    
    @jissekis.each_with_index do |jisseki, project|
      jisseki.each do |j|
        time = j.time.hour + j.time.min/60.0
        @sum_by_day[project][j.date.day] = time
        @sum_by_day[project][0] += time
      end
    end
  end

  def show
  end

  def new
    @jisseki = Jisseki.new
  end

  def create
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
      params.require(:jisseki).permit(:date, :time)
    end
  
end
