numPlayers = 0

function initPlayer(player)
  player:SetValue("bank", initialMoney)
  player:SetValue("score", 0)
  player:SetValue("rtv", false)
  Events:CallRemote("setMoney", player, {initialMoney})
end

