class Message < ApplicationRecord

  after_create_commit { MessageBroadcastJob.perform_now self }

  belongs_to :user

end
