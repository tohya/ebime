class JissekisController < ApplicationController
  before_action :signed_in_user

  def index
    @jissekis = Jisseki.paginate(page: params[:page])
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
