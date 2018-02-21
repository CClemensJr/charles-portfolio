# We have a comment that we are broadcasting a job on
class CommentBroadcastJob < ApplicationJob
  # We create a queue where the comments are going to be placed in a first come first serve list
  queue_as :default

  #Then we start a broadcast on ActionCable that creates a blog.id channel, identifies which channel the user is watching
  def perform(comment)
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  private

  # And then renders the comment paartial
  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end
