Package:Require("KeyHandler.lua")

tmczUI = WebUI(
    "Awesome UI", 
    "file:///UI/GUI.html", 
    true 
)


Events:on("EnterShop", function(shopOption) 
  Package:Log("Entered Shop")
  isShopping = true
  shoppingOption = shopOption
  Events:Call("showMessage", {"Store", tostring(shopOption), tostring(prices[shopOption][0]), "Price: $" .. tostring(prices[shopOption][option])})
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

Events:on("showMessage", function(title, subtitle, info, footer)
  -- Title, subtitle, info, footer
  tmczUI:CallEvent("showPopup", {true, title, subtitle, info, footer})
end)


Events:on("setLife", function(msg)
  -- Life (number only)
  tmczUI:CallEvent("setLife", {msg})
end)


Events:on("setMoney", function(msg)
  -- Money (number only)
  Package:Log("MONEY" .. msg)
  tmczUI:CallEvent("setMoney", {msg})
end)


Events:on("setEnemies", function(msg)
  -- Enemies (alives / total)
  tmczUI:CallEvent("setEnemies", {msg})
end)


Events:on("setBullets", function(msg)
  -- Bullets ( actual / total )
  tmczUI:CallEvent("setBullets", {msg})
end)

