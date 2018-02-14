# Create variable without defining it
ready = undefined

# Call sortable method from html5sortable lib and assign it to the ready variable
ready = ->
  $('.sortable').sortable()
  return

# When the page loads pass ready function
$(document).ready ready
