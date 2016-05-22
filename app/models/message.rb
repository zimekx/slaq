class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  belongs_to :room

  def to_json(options = {})
    super(only: [:content])
  end
end
