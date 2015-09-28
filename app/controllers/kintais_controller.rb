class KintaisController < ApplicationController
  before_action :signed_in_user

  def index

    if params[:method] == "post"
      @kintai = Kintai.where("user_id = ? AND date = ?", @current_user.id, Time.parse("#{params[:month]}/#{params[:day]}")).first
      if @kintai.blank?
        if params[:start_time]
          @kintai = Kintai.new(user_id: @current_user.id, date: Time.parse("#{params[:month]}/#{params[:day]}"), start: Time.parse("2000/1/1 #{params[:start_time].to_f.floor}:#{(params[:start_time].to_f % 1)*60}:00"))
        elsif params[:end_time]
          @kintai = Kintai.new(user_id: @current_user.id, date: Time.parse("#{params[:month]}/#{params[:day]}"), end: Time.parse("2000/1/1 #{params[:end_time].to_f.floor}:#{(params[:end_time].to_f % 1)*60}:00"))
        end
        if @kintai.save
          #flash[:success] = "勤怠が作成されました。"
        else
          #flash[:error] = "勤怠の作成に失敗しました。"
        end
      else
        if params[:start_time]
          kin =  @kintai.update_attributes(start: Time.parse("2000/1/1 #{params[:start_time].to_f.floor}:#{(params[:start_time].to_f % 1)*60}:00"))
        elsif params[:end_time]
          kin =  @kintai.update_attributes(end: Time.parse("2000/1/1 #{params[:end_time].to_f.floor}:#{(params[:end_time].to_f % 1)*60}:00"))
        end
        if kin
          #flash[:success] = "勤怠が更新されました。"
        else
          #flash[:error] = "勤怠の更新に失敗しました。"
        end
      end
    end

    if params[:month]
      @target_month = Time.parse("#{params[:month]}/1")      
    else
      @target_month = Time.now
    end

    @kintais = Kintai.where("user_id = ? AND date BETWEEN ? AND ?",@current_user.id, @target_month.beginning_of_month, @target_month.end_of_month)

    #勤怠時間を配列に整理
    #月の日数分配列を用意して0hで初期化
    #[0]に合計時間
    @sum_by_day = Array.new(@target_month.end_of_month.day+1, Hash.new(0))
    @kintais.each do |k|
      if k.start
        @sum_by_day[k.date.day][:start] = k.start.hour + k.start.min/60.0
      else
        @sum_by_day[k.date.day][:start] = 0
      end
      if k.end
        @sum_by_day[k.date.day][:end] = k.date.day
        #@sum_by_day[k.date.day][:end] = k.end.hour + k.end.min/60.0
      else
        @sum_by_day[k.date.day][:end] = 0
      end
      if k.start && k.end
        @sum_by_day[k.date.day][:time] = (k.end.hour + k.end.min/60.0) - (k.start.hour + k.start.min/60.0)
        @sum_by_day[0][:time] += (k.end.hour + k.end.min/60.0) - (k.start.hour + k.start.min/60.0)
      else
        @sum_by_day[k.date.day][:time] = 0
      end
    end
  end

  def show
  end

  def new
    @kintai = Kintai.new
  end

  def create
    @kintai = current_user.kintais.build(kintai_params)
    if @kintai.save
      flash[:success] = "勤怠が作成されました。"
      redirect_to @kintai
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

    def kintai_params
      params.require(:kintai).permit(:date, :time)
    end

end
