class EditorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "editor_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def sendText(data)
    mode = ['html', 'css', 'javascript'].index(data['mode'])
    c = Project.find(data['project_id']).codes[mode]
    puts mode, c
    c.update! text: data['text']
  end

  def sendMessage(data)
    Message.create! user_id: current_user.id, content: data['content'], project_id: data['project_id']
  end

end
