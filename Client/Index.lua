Package:Require("KeyHandler.lua")

Events:on("SetMoney", function(amount)
  money = amount
  updateMoney()
end)

Events:on("IncreaseMoney", function(amount)
  money = money + amount
  updateMoney()
end)

Events:on("UpdateHP", function(amount)
  updateHP()
end)

Events:on("ShowScoreboard", function(characters)
  showScoreboard(characters)
end)

my_ui = WebUI(
    "Awesome UI", 
    "file:///UI/GUI.html", 
    true 
)
