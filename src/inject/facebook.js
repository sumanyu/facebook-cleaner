// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var addClickEventListenerToSelectors, execAfterLoading, removeNewsFeedAfterLoading, removeSelectors, removeSelectorsById, removedFriendsYouMayKnow, removedNewsFeed;

    removeSelectorsById = function(selectors) {
      return removeSelectors(selectors.map(function(selector) {
        return document.getElementById(selector);
      }));
    };
    removeSelectors = function(selectors) {
      return selectors.forEach(function(selector) {
        return $(selector).remove();
      });
    };
    addClickEventListenerToSelectors = function(selectors, fn) {
      return selectors.forEach(function(selector) {
        return selector.addEventListener('click', fn, false);
      });
    };
    removeSelectorsById(['pagelet_ego_pane', 'pagelet_ego_contextual_group', 'topnews_main_stream_408239535924329', 'pagelet_trending_tags_and_topics']);
    execAfterLoading = function(testBoolean, existenceSelectorId, fn) {
      var tid, tryAgain;

      tid = void 0;
      if (!testBoolean) {
        tryAgain = function() {
          if (document.getElementById("" + existenceSelectorId)) {
            fn();
            testBoolean = true;
            return clearInterval(tid);
          } else {
            return tid = setTimeout(tryAgain, 100);
          }
        };
        tid = setTimeout(tryAgain, 100);
      }
      return testBoolean;
    };
    removedFriendsYouMayKnow = false;
    fbRequestsJewel.onclick = function() {
      return removedFriendsYouMayKnow = execAfterLoading(removedFriendsYouMayKnow, "fbRequestsPYMKContainer", function() {
        console.log("Removing friends");
        removeSelectorsById(["fbRequestsPYMKContainer", "fbRequestsPYMLContainer"]);
        return $(document.getElementsByClassName("jewelWithEgoUnits")[0]).removeAttr("style");
      });
    };
    removedNewsFeed = false;
    removeNewsFeedAfterLoading = function() {
      return removedNewsFeed = execAfterLoading(removedNewsFeed, "topnews_main_stream_408239535924329", function() {
        console.log("Removing newsfeed");
        return removeSelectorsById(["topnews_main_stream_408239535924329"]);
      });
    };
    return addClickEventListenerToSelectors([navItem_app_4748854339, pageLogo], removeNewsFeedAfterLoading);
  });

}).call(this);
