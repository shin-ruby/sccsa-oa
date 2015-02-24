class Apply < ActiveRecord::Base

  validates :user_id, :project_id, :category_id, :requirement, :site, :facilities, :address, :implement_time, :attachment, presence: true

  default_scope { order("applies.created_at DESC") }

  belongs_to :user, class_name: "User"
  belongs_to :project
  belongs_to :category
  has_many :notifications, as: :notificationable, dependent: :destroy
  has_one :verify, dependent: :destroy
  has_one :distribute, dependent: :destroy
  has_one :feedback, dependent: :destroy

  mount_uploader :attachment, AttachmentUploader

  after_create :new_notification
  after_update :update_notification

  private

  def new_notification
    admin = User.find(1)
    Notification.notify(admin, "<a href='/applies/#{self.id}'>#{self.user.unit}发送新配送申报</a>", self)
  end

  def update_notification
    admin = User.find(1)
    if self.verify.try(:is_pass) == false
      Notification.notify(admin, "<a href='/applies/#{self.id}'>#{self.user.unit}已重新发送配送申报</a>", self)
    end
  end


end
