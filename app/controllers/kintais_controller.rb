class KintaisController < ApplicationController
  before_action :signed_in_user

  def index
    @target_month = Time.now

    @kintais = Kintai.where("user_id = ?",@current_user.id)

    #勤怠時間を配列に整理
    #月の日数分配列を用意して0hで初期化
    #[0]に合計時間
    @sum_by_day = Array.new(@target_month.end_of_month.day+1, Hash.new(""))
    @kintais.each do |k|
      start = k.start.hour + k.start.min/60.0
      _end = k.end.hour + k.end.min/60.0
      @sum_by_day[k.date.day][:start] = start
      @sum_by_day[k.date.day][:end] = _end
      @sum_by_day[k.date.day][:time] = _end - start
      @sum_by_day[0][:time] += _end - start
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
