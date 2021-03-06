class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @notifications = Notification.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 30)
    respond_with(@notifications)
  end

  def show
    respond_with(@notification)
  end

  def new
    @notification = Notification.new
    respond_with(@notification)
  end

  def edit
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.save
    respond_with(@notification)
  end

  def update
    @notification.update(notification_params)
    @notification.read = true
    respond_with(@notification)
  end

  def destroy
    @notification.destroy
    respond_with(@notification)
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:user_id, :content, :notificationable_type, :notificationable_id)
    end
end
