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

  execAfterLoading = (testBoolean, existenceSelectorId, fn) ->

    console.log "testBoolean #{testBoolean}"
    console.log "existenceSelectorId #{existenceSelectorId}"
    console.log fn

    tid = undefined

    unless testBoolean
      tryAgain = ->
        if document.getElementById("#{existenceSelectorId}")

          fn()
          
          testBoolean = true
          clearInterval tid
        else
          tid = setTimeout(tryAgain, 100)

      tid = setTimeout(tryAgain, 100)

    testBoolean

  removedFriendsYouMayKnow = false
  # Removes people you may know and pages you may like
  fbRequestsJewel.onclick = ->

    removedFriendsYouMayKnow = execAfterLoading removedFriendsYouMayKnow, "fbRequestsPYMKContainer", ->
      console.log "Removing friends"

      removeSelectorsById ["fbRequestsPYMKContainer", "fbRequestsPYMLContainer"]

      # Remove inline width and height from scroll panel
      $(document.getElementsByClassName("jewelWithEgoUnits")[0]).removeAttr "style"  

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