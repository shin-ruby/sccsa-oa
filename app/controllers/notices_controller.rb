class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @q = Notice.ransack(params[:q])
    @notices = @q.result.paginate(:page => params[:page], :per_page => 10)
    respond_with(@notices)
  end

  def show
    if params[:from]
      notification = Notification.find(params[:from])
      # notification = @notice.notifications.unread(current_user.id).first
      notification.update_attribute(:read, true) if notification
    end
    respond_with(@notice)
  end

  def new
    @notice = Notice.new
    respond_with(@notice)
  end

  def edit
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.save
    respond_with(@notice)
  end

  def update
    @notice.update(notice_params)
    respond_with(@notice)
  end

  def destroy
    @notice.destroy
    respond_with(@notice)
  end

  private
    def set_notice
      @notice = Notice.find(params[:id])
    end

    def notice_params
      params.require(:notice).permit(:title, :content)
    end
end
