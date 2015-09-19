class KintaisController < ApplicationController
  before_action :signed_in_user

  def index
    @kintais = Kintai.paginate(page: params[:page])
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
