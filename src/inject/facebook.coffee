$ ->
  removeSelectorsById = (selectors) ->
    removeSelectors(selectors.map((selector) -> document.getElementById(selector)))

  removeSelectors = (selectors) ->
    selectors.forEach (selector) ->
      $(selector).remove()

  # Remove sidebars on the right
  removeSelectorsById [
    'pagelet_ego_pane', 
    'pagelet_ego_contextual_group', 

    # Remove news feed
    'topnews_main_stream_408239535924329'
  ]

  execAfterLoading = (testBoolean, existenceSelector, fn) ->
    tid = undefined

    unless testBoolean
      tryAgain = ->
        if existenceSelector

          fn()
          
          testBoolean = true
          clearInterval tid
        else
          console.log "Trying to remove friends"
          tid = setTimeout(tryAgain, 100)

      tid = setTimeout(tryAgain, 100)

    testBoolean

  removedFriendsYouMayKnow = false
  # Removes people you may know and pages you may like
  fbRequestsJewel.onclick = ->
    tid = undefined
    # console.log "Clicking friend request"

    unless removedFriendsYouMayKnow
      removeFriends = ->
        if document.getElementById("fbRequestsPYMKContainer")
          console.log "Removing friends"

          removeSelectorsById ["fbRequestsPYMKContainer", "fbRequestsPYMLContainer"]

          # Remove inline width and height from scroll panel
          $(document.getElementsByClassName("jewelWithEgoUnits")[0]).removeAttr "style"

          removedFriendsYouMayKnow = true
          clearInterval tid
        else
          console.log "Trying to remove friends"
          tid = setTimeout(removeFriends, 100)

      tid = setTimeout(removeFriends, 100)

  # didScroll = false

  # $(window).scroll ->
  #   timer = undefined
  #   unless didScroll
  #     timer = setInterval(->
  #       if didScroll
  #         didScroll = false
  #         clearTimeout timer
  #         removeGarbage()
  #     , 250)
  #   didScroll = true