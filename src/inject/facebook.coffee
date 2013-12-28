$ ->
  removedFriendsYouMayKnow = false

  removeGarbage = ->
    $("#pagelet_ego_pane").remove()
    $("#pagelet_ego_contextual_group").remove()

    # Removes people you may know and pages you may like
    fbRequestsJewel.onclick = ->
      removeFriends = undefined
      tid = undefined
      console.log "Clicking friend request"
      if removedFriendsYouMayKnow is false
        removeFriends = ->
          tid = undefined
          if document.getElementById("fbRequestsPYMKContainer")
            console.log "Removing friends"
            $(document.getElementById("fbRequestsPYMKContainer")).remove()
            $(document.getElementById("fbRequestsPYMLContainer")).remove()
            $(document.getElementsByClassName("jewelWithEgoUnits")[0]).removeAttr "style"
            removedFriendsYouMayKnow = true
            clearInterval tid
          else
            console.log "Trying to remove friends"
            tid = setTimeout(removeFriends, 100)

        tid = setTimeout(removeFriends, 100)

    # Remove news feed
    $("#topnews_main_stream_408239535924329").remove()

  removeGarbage()

  didScroll = false

  $(window).scroll ->
    timer = undefined
    unless didScroll
      timer = setInterval(->
        if didScroll
          didScroll = false
          clearTimeout timer
          removeGarbage()
      , 250)
    didScroll = true