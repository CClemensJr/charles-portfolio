ready = undefined
set_positions= undefined


set_positions = ->
  # Grab all card classes and iterate through them
  $('.card').each (i) ->
    # Assign the data-pos to the individual card then iterate to the next card
    $(this).attr 'data-pos', i + 1
    return
  return

# Call sortable method from html5sortable lib and assign it to the ready variable
ready = ->
  set_positions()
  # Grab sortable class
  $('.sortable').sortable()
  # Update the sorting based on click and drag
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    # Create an empty array
    updated_order = []
    # Call the set_positions method
    set_positions()
    # Add the card id to the updated_order array
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    # Allow the javascript to communicate with rails
    $.ajax
      # Make a put request to the path and update the value in the db
      type: 'PUT'
      url: '/portfolios/sort'
      data: order: updated_order
    return  
  return

# When the page loads pass ready function
$(document).ready ready
