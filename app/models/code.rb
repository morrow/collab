class Code < ApplicationRecord

  after_create_commit { EditorBroadcastJob.perform_later self }
  belongs_to :project

end
