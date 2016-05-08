class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }

  def to_json(options = {})
    super(only: [:content])
  end
end
