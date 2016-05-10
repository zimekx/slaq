class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  belongs_to :room

  belongs_to :user

  delegate :username, to: :user

  def to_json(options = {})
    super(only: [:content, :username])
  end
end
