Package:Require("KeyHandler.lua")

tmczUI = WebUI(
    "Awesome UI", 
    "file:///UI/GUI.html", 
    true 
)


Events:on("EnterShop", function(shopOption) 
  isShopping = true
  shoppingOption = shopOption
  Events:Call("showMessage", {tostring(shopOption)})
end)

Events:on("showMessage", function(msg)
  tmczUI:CallEvent("showPopup", {true, msg})
end)

Events:on("LeaveShop", function() 
  isShopping = false
  tmczUI:CallEvent("showPopup", {false})
end)


Events:on("gameStateHandler", function(shopOption) 
  tmczUI:CallEvent("showPopup", {true, tostring(shopOption)})
end)


Package:on("Unload", function()
  tmczUI:Destroy()
end)

