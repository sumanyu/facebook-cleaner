//example of using a message handler from the inject scripts
/*chrome.extension.onMessage.addListener(
  function(request, sender, sendResponse) {
  	chrome.pageAction.show(sender.tab.id);
    sendResponse();
  });
*/

console.log("Is this even loaded?");

chrome.tabs.onUpdated.addListener(function(tabId, changeInfo, tab) {
   console.log("Tab changed");
});
