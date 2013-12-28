$ ->
  removeSelectors = (selectors) ->
    selectors.forEach (selector) ->
      $(document.getElementById(selector)).remove()

  # Remove sidebars on the right
  $("#pagelet_ego_pane").remove()
  $("#pagelet_ego_contextual_group").remove()

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

          removeSelectors(["fbRequestsPYMKContainer", "fbRequestsPYMLContainer"])

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