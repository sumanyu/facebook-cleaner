$ ->
  removeSelectorsById = (selectors) ->
    removeSelectors(selectors, document.getElementById)

  removeSelectors = (selectors, fn) ->
    selectors.forEach (selector) ->
      $(fn(selector)).remove()

  # Remove sidebars on the right
  removeSelectorsById ['pagelet_ego_pane', 'pagelet_ego_contextual_group']

  removedFriendsYouMayKnow = false
  # Removes people you may know and pages you may like
  fbRequestsJewel.onclick = ->
    tid = undefined
    # console.log "Clicking friend request"

    unless removedFriendsYouMayKnow
      removeFriends = ->
        tid = undefined
        if document.getElementById("fbRequestsPYMKContainer")
          console.log "Removing friends"

          removeSelectorsById ["fbRequestsPYMKContainer", "fbRequestsPYMLContainer"]

          $(document.getElementsByClassName("jewelWithEgoUnits")[0]).removeAttr "style"
          removedFriendsYouMayKnow = true
          clearInterval tid
        else
          console.log "Trying to remove friends"
          tid = setTimeout(removeFriends, 100)

      tid = setTimeout(removeFriends, 100)

    # Remove news feed
    $("#topnews_main_stream_408239535924329").remove()


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