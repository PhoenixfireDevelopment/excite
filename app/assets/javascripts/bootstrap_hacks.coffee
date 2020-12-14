jQuery ->
  # Try with active tab
  activeTab = $("[data-target='" + location.hash + "']")
  activeTab and activeTab.tab('show')
  return
