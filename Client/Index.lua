Package:Require("GUI.lua")

isShopping = false
shoppingOption = nil


Events:on("UpdateHP", function(amount)
end)

Events:on("ShowScoreboard", function(characters)
  showScoreboard(characters)
end)

