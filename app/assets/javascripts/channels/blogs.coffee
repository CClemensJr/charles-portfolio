# Whenever this file is called
jQuery(document).on 'turbolinks:load', ->
  # create a comments variable that stores the items in the comment id on the page
  comments = $('#comments')

  # If a comment is available
  if comments.length > 0
    # Map the comments to ActionCable
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')
    },
    connected: ->
    disconnected: ->
    # When data is received
    received: (data) ->
      # Add the data to the comments
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id
      
  # Look for a new comment when the submit button is pressed
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('comment_content')

    if $.trim(textarea.val()).length > 1
      App.global_chat.send_comment textarea.val(),
      comments.data('blog-id')
      textarea.val('')
