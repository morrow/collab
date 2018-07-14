class EditorBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'editor_channel', data
  end

end
