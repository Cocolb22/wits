class LevelupNotification < Noticed::Base
  deliver_by :database
  deliver_by :action_cable, stream: :recipient_stream

  def recipient_stream
    recipient.id
  end
end
