// Generated by CoffeeScript 1.6.2
$(function() {
  var removeSelectors, removeSelectorsById, removedFriendsYouMayKnow;

  removeSelectorsById = function(selectors) {
    return removeSelectors(selectors, document.getElementById);
  };
  removeSelectors = function(selectors, fn) {
    return selectors.forEach(function(selector) {
      return $(fn(selector)).remove();
    });
  };
  removeSelectorsById(['pagelet_ego_pane', 'pagelet_ego_contextual_group']);
  removedFriendsYouMayKnow = false;
  return fbRequestsJewel.onclick = function() {
    var removeFriends, tid;

    tid = void 0;
    if (!removedFriendsYouMayKnow) {
      removeFriends = function() {
        tid = void 0;
        if (document.getElementById("fbRequestsPYMKContainer")) {
          console.log("Removing friends");
          removeSelectorsById(["fbRequestsPYMKContainer", "fbRequestsPYMLContainer"]);
          $(document.getElementsByClassName("jewelWithEgoUnits")[0]).removeAttr("style");
          removedFriendsYouMayKnow = true;
          return clearInterval(tid);
        } else {
          console.log("Trying to remove friends");
          return tid = setTimeout(removeFriends, 100);
        }
      };
      tid = setTimeout(removeFriends, 100);
    }
    return $("#topnews_main_stream_408239535924329").remove();
  };
});
