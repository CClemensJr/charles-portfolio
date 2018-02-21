class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }

  # This block immediately runs after a comment is created
  # It allows for multiple comments to be created at same time without crashing server
  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
