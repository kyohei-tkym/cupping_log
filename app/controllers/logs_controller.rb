class LogsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id
    if @log.save
      redirect_to logs_path
    else
      render :new
    end
  end

  def index
    @logs = Log.all
    @log = Log.new
  end

  def show
    @log = Log.find(params[:id])
    @log_comment = LogComment.new
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    @log.update(log_params)
    redirect_to log_path(@log.id)
  end

  def destroy
    @log= Log.find(params[:id])
    @log.destroy
    redirect_to logs_path
  end

  private

  def ensure_user
    @log = current_user.log
    @log = @log.find_by(params[:id])
    redirect_to log_path unless @log
  end


  def log_params
    params.require(:log).permit(:coffee_name, :shop_name, :price, :drink_date, :brew, :roast, :taste, :body, :memo, :rate, log_images_images: [])
  end
end
