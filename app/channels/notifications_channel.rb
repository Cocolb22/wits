class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "noticed:notification:#{current_user.id}"
  end
end
